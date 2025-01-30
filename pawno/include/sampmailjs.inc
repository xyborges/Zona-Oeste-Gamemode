#if !defined n_sampmailjs_include
    #define n_sampmailjs_include
#endif
#define SAMPMAILJS_RESPONSE_OK 200
#define SAMPMAILJS_RESPONSE_FORBIDEN 403
#define SAMPMAILJS_RESPONSE_ERROR 400
#define SAMPMAILJS_RESPONSE_NOTFOUND 404

#define SAMPMAILJS_URL "177.54.146.232:7784" // IP + PORT of the server running the NodeJS script
#define SAMPMAILJS_PASSWORD "4g768umi9" // This password should be the same as the NodeJS script
#define SAMPMAILJS_CONSOLELOG 0 // Log some information on console
#define SAMPMAILJS_MAXPOSTDATA 1024 // Cellsize of the variable that holds the data sent to the script. Lower for small emails, higher for more extense emails

new uniqueID = 0;
static stock CopyArgumentToHeap(arg, bool:pack = false, const argptr[] = "") {
	new arg_address, address;
	
	#emit LOAD.S.pri  0
	#emit ADD.C       12
	#emit LOAD.S.alt  arg
	#emit SHL.C.alt   2
	#emit ADD
	#emit LOAD.I
	#emit STOR.S.pri  arg_address
	#emit STOR.S.pri  argptr
	
	if (pack) {
		new bytes = ((strlen(argptr) + 1 + 3) / 4) * 4;
		
		#emit LCTRL       2
		#emit STOR.S.pri  address
		#emit LOAD.S.alt  bytes
		#emit ADD
		#emit SCTRL       2
		
		//strpack(dest[], const source[], maxlength = sizeof dest)
		#emit LOAD.S.pri  bytes
		#emit SHR.C.pri   2
		#emit PUSH.pri
		
		#emit PUSH.S      arg_address
		#emit PUSH.S      address
		
		#emit PUSH.C      12
		
		#emit SYSREQ.C    strpack
		#emit STACK       16
	} else {
		new bytes = (strlen(argptr) + 1) * 4;
		
		#emit LCTRL       2
		#emit STOR.S.pri  address
		#emit LOAD.S.alt  bytes
		#emit ADD
		#emit SCTRL       2
		
		//strunpack(dest[], const source[], maxlength = sizeof dest)
		#emit LOAD.S.pri  bytes
		#emit SHR.C.pri   2
		#emit PUSH.pri
		
		#emit PUSH.S      arg_address
		#emit PUSH.S      address
		
		#emit PUSH.C      12
		
		#emit SYSREQ.C    strunpack
		#emit STACK       16
	}
	
	#emit LOAD.S.pri  0
	#emit ADD.C       12
	#emit LOAD.S.alt  arg
	#emit SHL.C.alt   2
	#emit ADD
	#emit MOVE.alt
	#emit LOAD.S.pri  address
	#emit STOR.I
	
	return address;
}

stock strsize(const string[]) {
	new len = strlen(string);
	
	if (ispacked(string))
		return len + 1;
	
	return (len + 1) * 4;
}
static stock IsOverlapping(const str1[], size1 = sizeof(str1), const str2[], size2 = sizeof(str2)) {
	new addr1, addr2;
	
	if (size1 == -1) {
		size1 = strsize(str1);
	} else {
		size1 *= 4;
	}
	
	if (size2 == -1) {
		size2 = strsize(str2);
	} else {
		size2 *= 4;
	}
	
	#emit LOAD.S.pri  str1
	#emit STOR.S.pri  addr1
	#emit LOAD.S.pri  str2
	#emit STOR.S.pri  addr2

	return (addr1 < addr2 + size2) && (addr2 < addr1 + size1);
}

stock utf8encode(dest[], const source[], maxlength = sizeof(dest)) {
	new heap = 0;
	
	if (IsOverlapping(dest, maxlength, source, -1)) {
		heap = CopyArgumentToHeap(1);
	}
	
	new len = strlen(source);
	new packed = ispacked(source);
	
	dest[0] = '\0';
	
	new idx;
	for (new i = 0; i < len; i++) {
		new c = packed ? source{i} : source[i];
		
		if (c >= 0x80) {
			if (c > 0x4000000) {
				// 6 byte
				dest[idx++] = 0b11111100 | ((c >>> 30) & 0b00000001);
				dest[idx++] = 0b10000000 | ((c >>> 24) & 0b00111111);
				dest[idx++] = 0b10000000 | ((c >>> 18) & 0b00111111);
				dest[idx++] = 0b10000000 | ((c >>> 12) & 0b00111111);
				dest[idx++] = 0b10000000 | ((c >>> 6) & 0b00111111);
				dest[idx++] = 0b10000000 | (c & 0b00111111);
			} else if (c > 0x200000) {
				// 5 byte
				dest[idx++] = 0b11111000 | ((c >>> 24) & 0b00000011);
				dest[idx++] = 0b10000000 | ((c >>> 18) & 0b00111111);
				dest[idx++] = 0b10000000 | ((c >>> 12) & 0b00111111);
				dest[idx++] = 0b10000000 | ((c >>> 6) & 0b00111111);
				dest[idx++] = 0b10000000 | (c & 0b00111111);
			} else if (c > 0x10000) {
				// 4 byte
				dest[idx++] = 0b11110000 | ((c >>> 18) & 0b00000111);
				dest[idx++] = 0b10000000 | ((c >>> 12) & 0b00111111);
				dest[idx++] = 0b10000000 | ((c >>> 6) & 0b00111111);
				dest[idx++] = 0b10000000 | (c & 0b00111111);
			} else if (c > 0x800) {
				// 3 byte
				dest[idx++] = 0b11100000 | ((c >>> 12) & 0b00001111);
				dest[idx++] = 0b10000000 | ((c >>> 6) & 0b00111111);
				dest[idx++] = 0b10000000 | (c & 0b00111111);
			} else {
				// 2 byte
				dest[idx++] = 0b11000000 | ((c >>> 6) & 0b00011111);
				dest[idx++] = 0b10000000 | (c & 0b00111111);
				
			}
		} else if (c > 0) {
			dest[idx++] = c;
		}
	}
	
	dest[idx++] = '\0';
	if (heap) {
		RestoreHeapToAddress(heap);
	}
}

static stock RestoreHeapToAddress(address) {
	#emit LOAD.S.pri  address
	#emit SCTRL       2
}

forward HandleHTTPResponse(index, response_code, data[]);
public HandleHTTPResponse(index, response_code, data[]) {
    uniqueID++;

    #if SAMPMAILJS_CONSOLELOG == 1
		printf("\n[SAMPMAILJS] Server returned a response %d", response_code);
    #endif

    if (response_code == SAMPMAILJS_RESPONSE_OK) {
  		#if SAMPMAILJS_CONSOLELOG == 1
  			printf("\n[SAMPMAILJS] Email %d sent successfully", uniqueID);
  		#endif
    }

	return response_code;
}

stock SendEmail(const name[], const to[], const subject[], const text[], bool:isTemplate = false, templateName[] = "default.html") {
	new string[128], postData[SAMPMAILJS_MAXPOSTDATA];

	if(isTemplate) {
		format(string, sizeof string, "%s/sampmail.js?pw=%s&action=sendmtmp", SAMPMAILJS_URL, SAMPMAILJS_PASSWORD);
		format(postData, sizeof postData, "%s|%s|%s|%s|%s", name, to, subject, text, templateName);
	}
	else {
 		format(string, sizeof string, "%s/sampmail.js?pw=%s&action=sendm", SAMPMAILJS_URL, SAMPMAILJS_PASSWORD);
	  	format(postData, sizeof postData, "%s|%s|%s|%s", name, to, subject, text);
	}

  	utf8encode(postData, postData);
	return HTTP(uniqueID, HTTP_POST, string, postData, "HandleHTTPResponse");
}