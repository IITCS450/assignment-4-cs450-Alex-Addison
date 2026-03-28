
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	53                   	push   %ebx
    100e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100f:	83 ec 08             	sub    $0x8,%esp
    1012:	6a 02                	push   $0x2
    1014:	68 c8 17 00 00       	push   $0x17c8
    1019:	e8 65 03 00 00       	call   1383 <open>
    101e:	83 c4 10             	add    $0x10,%esp
    1021:	85 c0                	test   %eax,%eax
    1023:	0f 88 9f 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1029:	83 ec 0c             	sub    $0xc,%esp
    102c:	6a 00                	push   $0x0
    102e:	e8 88 03 00 00       	call   13bb <dup>
  dup(0);  // stderr
    1033:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103a:	e8 7c 03 00 00       	call   13bb <dup>
    103f:	83 c4 10             	add    $0x10,%esp
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1048:	83 ec 08             	sub    $0x8,%esp
    104b:	68 d0 17 00 00       	push   $0x17d0
    1050:	6a 01                	push   $0x1
    1052:	e8 49 04 00 00       	call   14a0 <printf>
    pid = fork();
    1057:	e8 df 02 00 00       	call   133b <fork>
    if(pid < 0){
    105c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    105f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1061:	85 c0                	test   %eax,%eax
    1063:	78 2c                	js     1091 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1065:	74 3d                	je     10a4 <main+0xa4>
    1067:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1070:	e8 d6 02 00 00       	call   134b <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 cf                	js     1048 <main+0x48>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 cb                	je     1048 <main+0x48>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 0f 18 00 00       	push   $0x180f
    1085:	6a 01                	push   $0x1
    1087:	e8 14 04 00 00       	call   14a0 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 e3 17 00 00       	push   $0x17e3
    1098:	6a 01                	push   $0x1
    109a:	e8 01 04 00 00       	call   14a0 <printf>
      exit();
    109f:	e8 9f 02 00 00       	call   1343 <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 24 1b 00 00       	push   $0x1b24
    10ab:	68 f6 17 00 00       	push   $0x17f6
    10b0:	e8 c6 02 00 00       	call   137b <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 f9 17 00 00       	push   $0x17f9
    10bc:	6a 01                	push   $0x1
    10be:	e8 dd 03 00 00       	call   14a0 <printf>
      exit();
    10c3:	e8 7b 02 00 00       	call   1343 <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 c8 17 00 00       	push   $0x17c8
    10d2:	e8 b4 02 00 00       	call   138b <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 c8 17 00 00       	push   $0x17c8
    10e0:	e8 9e 02 00 00       	call   1383 <open>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	e9 3c ff ff ff       	jmp    1029 <main+0x29>
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    10f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10f1:	31 c0                	xor    %eax,%eax
{
    10f3:	89 e5                	mov    %esp,%ebp
    10f5:	53                   	push   %ebx
    10f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1107:	83 c0 01             	add    $0x1,%eax
    110a:	84 d2                	test   %dl,%dl
    110c:	75 f2                	jne    1100 <strcpy+0x10>
    ;
  return os;
}
    110e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1111:	89 c8                	mov    %ecx,%eax
    1113:	c9                   	leave  
    1114:	c3                   	ret    
    1115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
    1127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    112a:	0f b6 02             	movzbl (%edx),%eax
    112d:	84 c0                	test   %al,%al
    112f:	75 17                	jne    1148 <strcmp+0x28>
    1131:	eb 3a                	jmp    116d <strcmp+0x4d>
    1133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1137:	90                   	nop
    1138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    113c:	83 c2 01             	add    $0x1,%edx
    113f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1142:	84 c0                	test   %al,%al
    1144:	74 1a                	je     1160 <strcmp+0x40>
    p++, q++;
    1146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1148:	0f b6 19             	movzbl (%ecx),%ebx
    114b:	38 c3                	cmp    %al,%bl
    114d:	74 e9                	je     1138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    114f:	29 d8                	sub    %ebx,%eax
}
    1151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1154:	c9                   	leave  
    1155:	c3                   	ret    
    1156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1164:	31 c0                	xor    %eax,%eax
    1166:	29 d8                	sub    %ebx,%eax
}
    1168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    116b:	c9                   	leave  
    116c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    116d:	0f b6 19             	movzbl (%ecx),%ebx
    1170:	31 c0                	xor    %eax,%eax
    1172:	eb db                	jmp    114f <strcmp+0x2f>
    1174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop

00001180 <strlen>:

uint
strlen(const char *s)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1186:	80 3a 00             	cmpb   $0x0,(%edx)
    1189:	74 15                	je     11a0 <strlen+0x20>
    118b:	31 c0                	xor    %eax,%eax
    118d:	8d 76 00             	lea    0x0(%esi),%esi
    1190:	83 c0 01             	add    $0x1,%eax
    1193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1197:	89 c1                	mov    %eax,%ecx
    1199:	75 f5                	jne    1190 <strlen+0x10>
    ;
  return n;
}
    119b:	89 c8                	mov    %ecx,%eax
    119d:	5d                   	pop    %ebp
    119e:	c3                   	ret    
    119f:	90                   	nop
  for(n = 0; s[n]; n++)
    11a0:	31 c9                	xor    %ecx,%ecx
}
    11a2:	5d                   	pop    %ebp
    11a3:	89 c8                	mov    %ecx,%eax
    11a5:	c3                   	ret    
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi

000011b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bd:	89 d7                	mov    %edx,%edi
    11bf:	fc                   	cld    
    11c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    11c5:	89 d0                	mov    %edx,%eax
    11c7:	c9                   	leave  
    11c8:	c3                   	ret    
    11c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011d0 <strchr>:

char*
strchr(const char *s, char c)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11da:	0f b6 10             	movzbl (%eax),%edx
    11dd:	84 d2                	test   %dl,%dl
    11df:	75 12                	jne    11f3 <strchr+0x23>
    11e1:	eb 1d                	jmp    1200 <strchr+0x30>
    11e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e7:	90                   	nop
    11e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    11ec:	83 c0 01             	add    $0x1,%eax
    11ef:	84 d2                	test   %dl,%dl
    11f1:	74 0d                	je     1200 <strchr+0x30>
    if(*s == c)
    11f3:	38 d1                	cmp    %dl,%cl
    11f5:	75 f1                	jne    11e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    11f7:	5d                   	pop    %ebp
    11f8:	c3                   	ret    
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1200:	31 c0                	xor    %eax,%eax
}
    1202:	5d                   	pop    %ebp
    1203:	c3                   	ret    
    1204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <gets>:

char*
gets(char *buf, int max)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1219:	31 db                	xor    %ebx,%ebx
{
    121b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    121e:	eb 27                	jmp    1247 <gets+0x37>
    cc = read(0, &c, 1);
    1220:	83 ec 04             	sub    $0x4,%esp
    1223:	6a 01                	push   $0x1
    1225:	57                   	push   %edi
    1226:	6a 00                	push   $0x0
    1228:	e8 2e 01 00 00       	call   135b <read>
    if(cc < 1)
    122d:	83 c4 10             	add    $0x10,%esp
    1230:	85 c0                	test   %eax,%eax
    1232:	7e 1d                	jle    1251 <gets+0x41>
      break;
    buf[i++] = c;
    1234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1238:	8b 55 08             	mov    0x8(%ebp),%edx
    123b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    123f:	3c 0a                	cmp    $0xa,%al
    1241:	74 1d                	je     1260 <gets+0x50>
    1243:	3c 0d                	cmp    $0xd,%al
    1245:	74 19                	je     1260 <gets+0x50>
  for(i=0; i+1 < max; ){
    1247:	89 de                	mov    %ebx,%esi
    1249:	83 c3 01             	add    $0x1,%ebx
    124c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    124f:	7c cf                	jl     1220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1251:	8b 45 08             	mov    0x8(%ebp),%eax
    1254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1258:	8d 65 f4             	lea    -0xc(%ebp),%esp
    125b:	5b                   	pop    %ebx
    125c:	5e                   	pop    %esi
    125d:	5f                   	pop    %edi
    125e:	5d                   	pop    %ebp
    125f:	c3                   	ret    
  buf[i] = '\0';
    1260:	8b 45 08             	mov    0x8(%ebp),%eax
    1263:	89 de                	mov    %ebx,%esi
    1265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    1269:	8d 65 f4             	lea    -0xc(%ebp),%esp
    126c:	5b                   	pop    %ebx
    126d:	5e                   	pop    %esi
    126e:	5f                   	pop    %edi
    126f:	5d                   	pop    %ebp
    1270:	c3                   	ret    
    1271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127f:	90                   	nop

00001280 <stat>:

int
stat(const char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1285:	83 ec 08             	sub    $0x8,%esp
    1288:	6a 00                	push   $0x0
    128a:	ff 75 08             	pushl  0x8(%ebp)
    128d:	e8 f1 00 00 00       	call   1383 <open>
  if(fd < 0)
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	85 c0                	test   %eax,%eax
    1297:	78 27                	js     12c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1299:	83 ec 08             	sub    $0x8,%esp
    129c:	ff 75 0c             	pushl  0xc(%ebp)
    129f:	89 c3                	mov    %eax,%ebx
    12a1:	50                   	push   %eax
    12a2:	e8 f4 00 00 00       	call   139b <fstat>
  close(fd);
    12a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12aa:	89 c6                	mov    %eax,%esi
  close(fd);
    12ac:	e8 ba 00 00 00       	call   136b <close>
  return r;
    12b1:	83 c4 10             	add    $0x10,%esp
}
    12b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12b7:	89 f0                	mov    %esi,%eax
    12b9:	5b                   	pop    %ebx
    12ba:	5e                   	pop    %esi
    12bb:	5d                   	pop    %ebp
    12bc:	c3                   	ret    
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12c5:	eb ed                	jmp    12b4 <stat+0x34>
    12c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ce:	66 90                	xchg   %ax,%ax

000012d0 <atoi>:

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 02             	movsbl (%edx),%eax
    12da:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    12e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    12e5:	77 1e                	ja     1305 <atoi+0x35>
    12e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12f0:	83 c2 01             	add    $0x1,%edx
    12f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    12f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    12fa:	0f be 02             	movsbl (%edx),%eax
    12fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1300:	80 fb 09             	cmp    $0x9,%bl
    1303:	76 eb                	jbe    12f0 <atoi+0x20>
  return n;
}
    1305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1308:	89 c8                	mov    %ecx,%eax
    130a:	c9                   	leave  
    130b:	c3                   	ret    
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	8b 45 10             	mov    0x10(%ebp),%eax
    1317:	8b 55 08             	mov    0x8(%ebp),%edx
    131a:	56                   	push   %esi
    131b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    131e:	85 c0                	test   %eax,%eax
    1320:	7e 13                	jle    1335 <memmove+0x25>
    1322:	01 d0                	add    %edx,%eax
  dst = vdst;
    1324:	89 d7                	mov    %edx,%edi
    1326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1331:	39 f8                	cmp    %edi,%eax
    1333:	75 fb                	jne    1330 <memmove+0x20>
  return vdst;
}
    1335:	5e                   	pop    %esi
    1336:	89 d0                	mov    %edx,%eax
    1338:	5f                   	pop    %edi
    1339:	5d                   	pop    %ebp
    133a:	c3                   	ret    

0000133b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    133b:	b8 01 00 00 00       	mov    $0x1,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <exit>:
SYSCALL(exit)
    1343:	b8 02 00 00 00       	mov    $0x2,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <wait>:
SYSCALL(wait)
    134b:	b8 03 00 00 00       	mov    $0x3,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <pipe>:
SYSCALL(pipe)
    1353:	b8 04 00 00 00       	mov    $0x4,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <read>:
SYSCALL(read)
    135b:	b8 05 00 00 00       	mov    $0x5,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <write>:
SYSCALL(write)
    1363:	b8 10 00 00 00       	mov    $0x10,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <close>:
SYSCALL(close)
    136b:	b8 15 00 00 00       	mov    $0x15,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <kill>:
SYSCALL(kill)
    1373:	b8 06 00 00 00       	mov    $0x6,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <exec>:
SYSCALL(exec)
    137b:	b8 07 00 00 00       	mov    $0x7,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <open>:
SYSCALL(open)
    1383:	b8 0f 00 00 00       	mov    $0xf,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <mknod>:
SYSCALL(mknod)
    138b:	b8 11 00 00 00       	mov    $0x11,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <unlink>:
SYSCALL(unlink)
    1393:	b8 12 00 00 00       	mov    $0x12,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <fstat>:
SYSCALL(fstat)
    139b:	b8 08 00 00 00       	mov    $0x8,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <link>:
SYSCALL(link)
    13a3:	b8 13 00 00 00       	mov    $0x13,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <mkdir>:
SYSCALL(mkdir)
    13ab:	b8 14 00 00 00       	mov    $0x14,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <chdir>:
SYSCALL(chdir)
    13b3:	b8 09 00 00 00       	mov    $0x9,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <dup>:
SYSCALL(dup)
    13bb:	b8 0a 00 00 00       	mov    $0xa,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <getpid>:
SYSCALL(getpid)
    13c3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <sbrk>:
SYSCALL(sbrk)
    13cb:	b8 0c 00 00 00       	mov    $0xc,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <sleep>:
SYSCALL(sleep)
    13d3:	b8 0d 00 00 00       	mov    $0xd,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <uptime>:
SYSCALL(uptime)
    13db:	b8 0e 00 00 00       	mov    $0xe,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    
    13e3:	66 90                	xchg   %ax,%ax
    13e5:	66 90                	xchg   %ax,%ax
    13e7:	66 90                	xchg   %ax,%ax
    13e9:	66 90                	xchg   %ax,%ax
    13eb:	66 90                	xchg   %ax,%ax
    13ed:	66 90                	xchg   %ax,%ax
    13ef:	90                   	nop

000013f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
    13f6:	83 ec 3c             	sub    $0x3c,%esp
    13f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    13fc:	89 d1                	mov    %edx,%ecx
{
    13fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1401:	85 d2                	test   %edx,%edx
    1403:	0f 89 7f 00 00 00    	jns    1488 <printint+0x98>
    1409:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    140d:	74 79                	je     1488 <printint+0x98>
    neg = 1;
    140f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1416:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1418:	31 db                	xor    %ebx,%ebx
    141a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    141d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1420:	89 c8                	mov    %ecx,%eax
    1422:	31 d2                	xor    %edx,%edx
    1424:	89 cf                	mov    %ecx,%edi
    1426:	f7 75 c4             	divl   -0x3c(%ebp)
    1429:	0f b6 92 78 18 00 00 	movzbl 0x1878(%edx),%edx
    1430:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1433:	89 d8                	mov    %ebx,%eax
    1435:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1438:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    143b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    143e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1441:	76 dd                	jbe    1420 <printint+0x30>
  if(neg)
    1443:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1446:	85 c9                	test   %ecx,%ecx
    1448:	74 0c                	je     1456 <printint+0x66>
    buf[i++] = '-';
    144a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    144f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1451:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1456:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1459:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    145d:	eb 07                	jmp    1466 <printint+0x76>
    145f:	90                   	nop
    putc(fd, buf[i]);
    1460:	0f b6 13             	movzbl (%ebx),%edx
    1463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1466:	83 ec 04             	sub    $0x4,%esp
    1469:	88 55 d7             	mov    %dl,-0x29(%ebp)
    146c:	6a 01                	push   $0x1
    146e:	56                   	push   %esi
    146f:	57                   	push   %edi
    1470:	e8 ee fe ff ff       	call   1363 <write>
  while(--i >= 0)
    1475:	83 c4 10             	add    $0x10,%esp
    1478:	39 de                	cmp    %ebx,%esi
    147a:	75 e4                	jne    1460 <printint+0x70>
}
    147c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    147f:	5b                   	pop    %ebx
    1480:	5e                   	pop    %esi
    1481:	5f                   	pop    %edi
    1482:	5d                   	pop    %ebp
    1483:	c3                   	ret    
    1484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1488:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    148f:	eb 87                	jmp    1418 <printint+0x28>
    1491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149f:	90                   	nop

000014a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
    14a4:	56                   	push   %esi
    14a5:	53                   	push   %ebx
    14a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    14ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    14af:	0f b6 13             	movzbl (%ebx),%edx
    14b2:	84 d2                	test   %dl,%dl
    14b4:	74 6a                	je     1520 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    14b6:	8d 45 10             	lea    0x10(%ebp),%eax
    14b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    14bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    14c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14c4:	eb 36                	jmp    14fc <printf+0x5c>
    14c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cd:	8d 76 00             	lea    0x0(%esi),%esi
    14d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    14d8:	83 f8 25             	cmp    $0x25,%eax
    14db:	74 15                	je     14f2 <printf+0x52>
  write(fd, &c, 1);
    14dd:	83 ec 04             	sub    $0x4,%esp
    14e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14e3:	6a 01                	push   $0x1
    14e5:	57                   	push   %edi
    14e6:	56                   	push   %esi
    14e7:	e8 77 fe ff ff       	call   1363 <write>
    14ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    14ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    14f2:	0f b6 13             	movzbl (%ebx),%edx
    14f5:	83 c3 01             	add    $0x1,%ebx
    14f8:	84 d2                	test   %dl,%dl
    14fa:	74 24                	je     1520 <printf+0x80>
    c = fmt[i] & 0xff;
    14fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    14ff:	85 c9                	test   %ecx,%ecx
    1501:	74 cd                	je     14d0 <printf+0x30>
      }
    } else if(state == '%'){
    1503:	83 f9 25             	cmp    $0x25,%ecx
    1506:	75 ea                	jne    14f2 <printf+0x52>
      if(c == 'd'){
    1508:	83 f8 25             	cmp    $0x25,%eax
    150b:	0f 84 07 01 00 00    	je     1618 <printf+0x178>
    1511:	83 e8 63             	sub    $0x63,%eax
    1514:	83 f8 15             	cmp    $0x15,%eax
    1517:	77 17                	ja     1530 <printf+0x90>
    1519:	ff 24 85 20 18 00 00 	jmp    *0x1820(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1520:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1523:	5b                   	pop    %ebx
    1524:	5e                   	pop    %esi
    1525:	5f                   	pop    %edi
    1526:	5d                   	pop    %ebp
    1527:	c3                   	ret    
    1528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152f:	90                   	nop
  write(fd, &c, 1);
    1530:	83 ec 04             	sub    $0x4,%esp
    1533:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1536:	6a 01                	push   $0x1
    1538:	57                   	push   %edi
    1539:	56                   	push   %esi
    153a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    153e:	e8 20 fe ff ff       	call   1363 <write>
        putc(fd, c);
    1543:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1547:	83 c4 0c             	add    $0xc,%esp
    154a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    154d:	6a 01                	push   $0x1
    154f:	57                   	push   %edi
    1550:	56                   	push   %esi
    1551:	e8 0d fe ff ff       	call   1363 <write>
        putc(fd, c);
    1556:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1559:	31 c9                	xor    %ecx,%ecx
    155b:	eb 95                	jmp    14f2 <printf+0x52>
    155d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1560:	83 ec 0c             	sub    $0xc,%esp
    1563:	b9 10 00 00 00       	mov    $0x10,%ecx
    1568:	6a 00                	push   $0x0
    156a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    156d:	8b 10                	mov    (%eax),%edx
    156f:	89 f0                	mov    %esi,%eax
    1571:	e8 7a fe ff ff       	call   13f0 <printint>
        ap++;
    1576:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    157a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    157d:	31 c9                	xor    %ecx,%ecx
    157f:	e9 6e ff ff ff       	jmp    14f2 <printf+0x52>
    1584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1588:	8b 45 d0             	mov    -0x30(%ebp),%eax
    158b:	8b 10                	mov    (%eax),%edx
        ap++;
    158d:	83 c0 04             	add    $0x4,%eax
    1590:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1593:	85 d2                	test   %edx,%edx
    1595:	0f 84 8d 00 00 00    	je     1628 <printf+0x188>
        while(*s != 0){
    159b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    159e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    15a0:	84 c0                	test   %al,%al
    15a2:	0f 84 4a ff ff ff    	je     14f2 <printf+0x52>
    15a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15ab:	89 d3                	mov    %edx,%ebx
    15ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    15b0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15b3:	83 c3 01             	add    $0x1,%ebx
    15b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15b9:	6a 01                	push   $0x1
    15bb:	57                   	push   %edi
    15bc:	56                   	push   %esi
    15bd:	e8 a1 fd ff ff       	call   1363 <write>
        while(*s != 0){
    15c2:	0f b6 03             	movzbl (%ebx),%eax
    15c5:	83 c4 10             	add    $0x10,%esp
    15c8:	84 c0                	test   %al,%al
    15ca:	75 e4                	jne    15b0 <printf+0x110>
      state = 0;
    15cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    15cf:	31 c9                	xor    %ecx,%ecx
    15d1:	e9 1c ff ff ff       	jmp    14f2 <printf+0x52>
    15d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15e0:	83 ec 0c             	sub    $0xc,%esp
    15e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15e8:	6a 01                	push   $0x1
    15ea:	e9 7b ff ff ff       	jmp    156a <printf+0xca>
    15ef:	90                   	nop
        putc(fd, *ap);
    15f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    15f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    15f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    15f8:	6a 01                	push   $0x1
    15fa:	57                   	push   %edi
    15fb:	56                   	push   %esi
        putc(fd, *ap);
    15fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15ff:	e8 5f fd ff ff       	call   1363 <write>
        ap++;
    1604:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1608:	83 c4 10             	add    $0x10,%esp
      state = 0;
    160b:	31 c9                	xor    %ecx,%ecx
    160d:	e9 e0 fe ff ff       	jmp    14f2 <printf+0x52>
    1612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1618:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    161b:	83 ec 04             	sub    $0x4,%esp
    161e:	e9 2a ff ff ff       	jmp    154d <printf+0xad>
    1623:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1627:	90                   	nop
          s = "(null)";
    1628:	ba 18 18 00 00       	mov    $0x1818,%edx
        while(*s != 0){
    162d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1630:	b8 28 00 00 00       	mov    $0x28,%eax
    1635:	89 d3                	mov    %edx,%ebx
    1637:	e9 74 ff ff ff       	jmp    15b0 <printf+0x110>
    163c:	66 90                	xchg   %ax,%ax
    163e:	66 90                	xchg   %ax,%ax

00001640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1641:	a1 2c 1b 00 00       	mov    0x1b2c,%eax
{
    1646:	89 e5                	mov    %esp,%ebp
    1648:	57                   	push   %edi
    1649:	56                   	push   %esi
    164a:	53                   	push   %ebx
    164b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    164e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1658:	89 c2                	mov    %eax,%edx
    165a:	8b 00                	mov    (%eax),%eax
    165c:	39 ca                	cmp    %ecx,%edx
    165e:	73 30                	jae    1690 <free+0x50>
    1660:	39 c1                	cmp    %eax,%ecx
    1662:	72 04                	jb     1668 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1664:	39 c2                	cmp    %eax,%edx
    1666:	72 f0                	jb     1658 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1668:	8b 73 fc             	mov    -0x4(%ebx),%esi
    166b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    166e:	39 f8                	cmp    %edi,%eax
    1670:	74 30                	je     16a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1672:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1675:	8b 42 04             	mov    0x4(%edx),%eax
    1678:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    167b:	39 f1                	cmp    %esi,%ecx
    167d:	74 3a                	je     16b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    167f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1681:	5b                   	pop    %ebx
  freep = p;
    1682:	89 15 2c 1b 00 00    	mov    %edx,0x1b2c
}
    1688:	5e                   	pop    %esi
    1689:	5f                   	pop    %edi
    168a:	5d                   	pop    %ebp
    168b:	c3                   	ret    
    168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1690:	39 c2                	cmp    %eax,%edx
    1692:	72 c4                	jb     1658 <free+0x18>
    1694:	39 c1                	cmp    %eax,%ecx
    1696:	73 c0                	jae    1658 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1698:	8b 73 fc             	mov    -0x4(%ebx),%esi
    169b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    169e:	39 f8                	cmp    %edi,%eax
    16a0:	75 d0                	jne    1672 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    16a2:	03 70 04             	add    0x4(%eax),%esi
    16a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16a8:	8b 02                	mov    (%edx),%eax
    16aa:	8b 00                	mov    (%eax),%eax
    16ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    16af:	8b 42 04             	mov    0x4(%edx),%eax
    16b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    16b5:	39 f1                	cmp    %esi,%ecx
    16b7:	75 c6                	jne    167f <free+0x3f>
    p->s.size += bp->s.size;
    16b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    16bc:	89 15 2c 1b 00 00    	mov    %edx,0x1b2c
    p->s.size += bp->s.size;
    16c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    16c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    16c8:	89 0a                	mov    %ecx,(%edx)
}
    16ca:	5b                   	pop    %ebx
    16cb:	5e                   	pop    %esi
    16cc:	5f                   	pop    %edi
    16cd:	5d                   	pop    %ebp
    16ce:	c3                   	ret    
    16cf:	90                   	nop

000016d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16d0:	55                   	push   %ebp
    16d1:	89 e5                	mov    %esp,%ebp
    16d3:	57                   	push   %edi
    16d4:	56                   	push   %esi
    16d5:	53                   	push   %ebx
    16d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16dc:	8b 3d 2c 1b 00 00    	mov    0x1b2c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e2:	8d 70 07             	lea    0x7(%eax),%esi
    16e5:	c1 ee 03             	shr    $0x3,%esi
    16e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16eb:	85 ff                	test   %edi,%edi
    16ed:	0f 84 9d 00 00 00    	je     1790 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    16f5:	8b 4a 04             	mov    0x4(%edx),%ecx
    16f8:	39 f1                	cmp    %esi,%ecx
    16fa:	73 6a                	jae    1766 <malloc+0x96>
    16fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1701:	39 de                	cmp    %ebx,%esi
    1703:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1706:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    170d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1710:	eb 17                	jmp    1729 <malloc+0x59>
    1712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1718:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    171a:	8b 48 04             	mov    0x4(%eax),%ecx
    171d:	39 f1                	cmp    %esi,%ecx
    171f:	73 4f                	jae    1770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1721:	8b 3d 2c 1b 00 00    	mov    0x1b2c,%edi
    1727:	89 c2                	mov    %eax,%edx
    1729:	39 d7                	cmp    %edx,%edi
    172b:	75 eb                	jne    1718 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    172d:	83 ec 0c             	sub    $0xc,%esp
    1730:	ff 75 e4             	pushl  -0x1c(%ebp)
    1733:	e8 93 fc ff ff       	call   13cb <sbrk>
  if(p == (char*)-1)
    1738:	83 c4 10             	add    $0x10,%esp
    173b:	83 f8 ff             	cmp    $0xffffffff,%eax
    173e:	74 1c                	je     175c <malloc+0x8c>
  hp->s.size = nu;
    1740:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1743:	83 ec 0c             	sub    $0xc,%esp
    1746:	83 c0 08             	add    $0x8,%eax
    1749:	50                   	push   %eax
    174a:	e8 f1 fe ff ff       	call   1640 <free>
  return freep;
    174f:	8b 15 2c 1b 00 00    	mov    0x1b2c,%edx
      if((p = morecore(nunits)) == 0)
    1755:	83 c4 10             	add    $0x10,%esp
    1758:	85 d2                	test   %edx,%edx
    175a:	75 bc                	jne    1718 <malloc+0x48>
        return 0;
  }
}
    175c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    175f:	31 c0                	xor    %eax,%eax
}
    1761:	5b                   	pop    %ebx
    1762:	5e                   	pop    %esi
    1763:	5f                   	pop    %edi
    1764:	5d                   	pop    %ebp
    1765:	c3                   	ret    
    if(p->s.size >= nunits){
    1766:	89 d0                	mov    %edx,%eax
    1768:	89 fa                	mov    %edi,%edx
    176a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1770:	39 ce                	cmp    %ecx,%esi
    1772:	74 4c                	je     17c0 <malloc+0xf0>
        p->s.size -= nunits;
    1774:	29 f1                	sub    %esi,%ecx
    1776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    177c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    177f:	89 15 2c 1b 00 00    	mov    %edx,0x1b2c
}
    1785:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1788:	83 c0 08             	add    $0x8,%eax
}
    178b:	5b                   	pop    %ebx
    178c:	5e                   	pop    %esi
    178d:	5f                   	pop    %edi
    178e:	5d                   	pop    %ebp
    178f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1790:	c7 05 2c 1b 00 00 30 	movl   $0x1b30,0x1b2c
    1797:	1b 00 00 
    base.s.size = 0;
    179a:	bf 30 1b 00 00       	mov    $0x1b30,%edi
    base.s.ptr = freep = prevp = &base;
    179f:	c7 05 30 1b 00 00 30 	movl   $0x1b30,0x1b30
    17a6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    17ab:	c7 05 34 1b 00 00 00 	movl   $0x0,0x1b34
    17b2:	00 00 00 
    if(p->s.size >= nunits){
    17b5:	e9 42 ff ff ff       	jmp    16fc <malloc+0x2c>
    17ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17c0:	8b 08                	mov    (%eax),%ecx
    17c2:	89 0a                	mov    %ecx,(%edx)
    17c4:	eb b9                	jmp    177f <malloc+0xaf>
