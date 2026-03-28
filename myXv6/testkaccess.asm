
_testkaccess:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(void){
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 1c             	sub    $0x1c,%esp
  printf(1, "testkaccess: illegal read attempt\n");
    1011:	68 18 17 00 00       	push   $0x1718
    1016:	6a 01                	push   $0x1
    1018:	e8 d3 03 00 00       	call   13f0 <printf>
  volatile int *p = (int*)0xFFFF0000;
  volatile int x = *p;
    101d:	a1 00 00 ff ff       	mov    0xffff0000,%eax
  printf(1, "UNEXPECTED: read=%d\n", x);
    1022:	83 c4 0c             	add    $0xc,%esp
  volatile int x = *p;
    1025:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1, "UNEXPECTED: read=%d\n", x);
    1028:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102b:	50                   	push   %eax
    102c:	68 3b 17 00 00       	push   $0x173b
    1031:	6a 01                	push   $0x1
    1033:	e8 b8 03 00 00       	call   13f0 <printf>
  exit();
    1038:	e8 56 02 00 00       	call   1293 <exit>
    103d:	66 90                	xchg   %ax,%ax
    103f:	90                   	nop

00001040 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1040:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1041:	31 c0                	xor    %eax,%eax
{
    1043:	89 e5                	mov    %esp,%ebp
    1045:	53                   	push   %ebx
    1046:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1049:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1050:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1054:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1057:	83 c0 01             	add    $0x1,%eax
    105a:	84 d2                	test   %dl,%dl
    105c:	75 f2                	jne    1050 <strcpy+0x10>
    ;
  return os;
}
    105e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1061:	89 c8                	mov    %ecx,%eax
    1063:	c9                   	leave  
    1064:	c3                   	ret    
    1065:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001070 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	53                   	push   %ebx
    1074:	8b 55 08             	mov    0x8(%ebp),%edx
    1077:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    107a:	0f b6 02             	movzbl (%edx),%eax
    107d:	84 c0                	test   %al,%al
    107f:	75 17                	jne    1098 <strcmp+0x28>
    1081:	eb 3a                	jmp    10bd <strcmp+0x4d>
    1083:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1087:	90                   	nop
    1088:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    108c:	83 c2 01             	add    $0x1,%edx
    108f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1092:	84 c0                	test   %al,%al
    1094:	74 1a                	je     10b0 <strcmp+0x40>
    p++, q++;
    1096:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    1098:	0f b6 19             	movzbl (%ecx),%ebx
    109b:	38 c3                	cmp    %al,%bl
    109d:	74 e9                	je     1088 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    109f:	29 d8                	sub    %ebx,%eax
}
    10a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10a4:	c9                   	leave  
    10a5:	c3                   	ret    
    10a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10b4:	31 c0                	xor    %eax,%eax
    10b6:	29 d8                	sub    %ebx,%eax
}
    10b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10bb:	c9                   	leave  
    10bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10bd:	0f b6 19             	movzbl (%ecx),%ebx
    10c0:	31 c0                	xor    %eax,%eax
    10c2:	eb db                	jmp    109f <strcmp+0x2f>
    10c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10cf:	90                   	nop

000010d0 <strlen>:

uint
strlen(const char *s)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10d6:	80 3a 00             	cmpb   $0x0,(%edx)
    10d9:	74 15                	je     10f0 <strlen+0x20>
    10db:	31 c0                	xor    %eax,%eax
    10dd:	8d 76 00             	lea    0x0(%esi),%esi
    10e0:	83 c0 01             	add    $0x1,%eax
    10e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10e7:	89 c1                	mov    %eax,%ecx
    10e9:	75 f5                	jne    10e0 <strlen+0x10>
    ;
  return n;
}
    10eb:	89 c8                	mov    %ecx,%eax
    10ed:	5d                   	pop    %ebp
    10ee:	c3                   	ret    
    10ef:	90                   	nop
  for(n = 0; s[n]; n++)
    10f0:	31 c9                	xor    %ecx,%ecx
}
    10f2:	5d                   	pop    %ebp
    10f3:	89 c8                	mov    %ecx,%eax
    10f5:	c3                   	ret    
    10f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fd:	8d 76 00             	lea    0x0(%esi),%esi

00001100 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	57                   	push   %edi
    1104:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1107:	8b 4d 10             	mov    0x10(%ebp),%ecx
    110a:	8b 45 0c             	mov    0xc(%ebp),%eax
    110d:	89 d7                	mov    %edx,%edi
    110f:	fc                   	cld    
    1110:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1112:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1115:	89 d0                	mov    %edx,%eax
    1117:	c9                   	leave  
    1118:	c3                   	ret    
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001120 <strchr>:

char*
strchr(const char *s, char c)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 45 08             	mov    0x8(%ebp),%eax
    1126:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    112a:	0f b6 10             	movzbl (%eax),%edx
    112d:	84 d2                	test   %dl,%dl
    112f:	75 12                	jne    1143 <strchr+0x23>
    1131:	eb 1d                	jmp    1150 <strchr+0x30>
    1133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1137:	90                   	nop
    1138:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    113c:	83 c0 01             	add    $0x1,%eax
    113f:	84 d2                	test   %dl,%dl
    1141:	74 0d                	je     1150 <strchr+0x30>
    if(*s == c)
    1143:	38 d1                	cmp    %dl,%cl
    1145:	75 f1                	jne    1138 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1147:	5d                   	pop    %ebp
    1148:	c3                   	ret    
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1150:	31 c0                	xor    %eax,%eax
}
    1152:	5d                   	pop    %ebp
    1153:	c3                   	ret    
    1154:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    115f:	90                   	nop

00001160 <gets>:

char*
gets(char *buf, int max)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
    1164:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1165:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1168:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1169:	31 db                	xor    %ebx,%ebx
{
    116b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    116e:	eb 27                	jmp    1197 <gets+0x37>
    cc = read(0, &c, 1);
    1170:	83 ec 04             	sub    $0x4,%esp
    1173:	6a 01                	push   $0x1
    1175:	57                   	push   %edi
    1176:	6a 00                	push   $0x0
    1178:	e8 2e 01 00 00       	call   12ab <read>
    if(cc < 1)
    117d:	83 c4 10             	add    $0x10,%esp
    1180:	85 c0                	test   %eax,%eax
    1182:	7e 1d                	jle    11a1 <gets+0x41>
      break;
    buf[i++] = c;
    1184:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1188:	8b 55 08             	mov    0x8(%ebp),%edx
    118b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    118f:	3c 0a                	cmp    $0xa,%al
    1191:	74 1d                	je     11b0 <gets+0x50>
    1193:	3c 0d                	cmp    $0xd,%al
    1195:	74 19                	je     11b0 <gets+0x50>
  for(i=0; i+1 < max; ){
    1197:	89 de                	mov    %ebx,%esi
    1199:	83 c3 01             	add    $0x1,%ebx
    119c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    119f:	7c cf                	jl     1170 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11a1:	8b 45 08             	mov    0x8(%ebp),%eax
    11a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11ab:	5b                   	pop    %ebx
    11ac:	5e                   	pop    %esi
    11ad:	5f                   	pop    %edi
    11ae:	5d                   	pop    %ebp
    11af:	c3                   	ret    
  buf[i] = '\0';
    11b0:	8b 45 08             	mov    0x8(%ebp),%eax
    11b3:	89 de                	mov    %ebx,%esi
    11b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11bc:	5b                   	pop    %ebx
    11bd:	5e                   	pop    %esi
    11be:	5f                   	pop    %edi
    11bf:	5d                   	pop    %ebp
    11c0:	c3                   	ret    
    11c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cf:	90                   	nop

000011d0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	56                   	push   %esi
    11d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11d5:	83 ec 08             	sub    $0x8,%esp
    11d8:	6a 00                	push   $0x0
    11da:	ff 75 08             	pushl  0x8(%ebp)
    11dd:	e8 f1 00 00 00       	call   12d3 <open>
  if(fd < 0)
    11e2:	83 c4 10             	add    $0x10,%esp
    11e5:	85 c0                	test   %eax,%eax
    11e7:	78 27                	js     1210 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11e9:	83 ec 08             	sub    $0x8,%esp
    11ec:	ff 75 0c             	pushl  0xc(%ebp)
    11ef:	89 c3                	mov    %eax,%ebx
    11f1:	50                   	push   %eax
    11f2:	e8 f4 00 00 00       	call   12eb <fstat>
  close(fd);
    11f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11fa:	89 c6                	mov    %eax,%esi
  close(fd);
    11fc:	e8 ba 00 00 00       	call   12bb <close>
  return r;
    1201:	83 c4 10             	add    $0x10,%esp
}
    1204:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1207:	89 f0                	mov    %esi,%eax
    1209:	5b                   	pop    %ebx
    120a:	5e                   	pop    %esi
    120b:	5d                   	pop    %ebp
    120c:	c3                   	ret    
    120d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1210:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1215:	eb ed                	jmp    1204 <stat+0x34>
    1217:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    121e:	66 90                	xchg   %ax,%ax

00001220 <atoi>:

int
atoi(const char *s)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	53                   	push   %ebx
    1224:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1227:	0f be 02             	movsbl (%edx),%eax
    122a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    122d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1230:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1235:	77 1e                	ja     1255 <atoi+0x35>
    1237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1240:	83 c2 01             	add    $0x1,%edx
    1243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1246:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    124a:	0f be 02             	movsbl (%edx),%eax
    124d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1250:	80 fb 09             	cmp    $0x9,%bl
    1253:	76 eb                	jbe    1240 <atoi+0x20>
  return n;
}
    1255:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1258:	89 c8                	mov    %ecx,%eax
    125a:	c9                   	leave  
    125b:	c3                   	ret    
    125c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	57                   	push   %edi
    1264:	8b 45 10             	mov    0x10(%ebp),%eax
    1267:	8b 55 08             	mov    0x8(%ebp),%edx
    126a:	56                   	push   %esi
    126b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    126e:	85 c0                	test   %eax,%eax
    1270:	7e 13                	jle    1285 <memmove+0x25>
    1272:	01 d0                	add    %edx,%eax
  dst = vdst;
    1274:	89 d7                	mov    %edx,%edi
    1276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1280:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1281:	39 f8                	cmp    %edi,%eax
    1283:	75 fb                	jne    1280 <memmove+0x20>
  return vdst;
}
    1285:	5e                   	pop    %esi
    1286:	89 d0                	mov    %edx,%eax
    1288:	5f                   	pop    %edi
    1289:	5d                   	pop    %ebp
    128a:	c3                   	ret    

0000128b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    128b:	b8 01 00 00 00       	mov    $0x1,%eax
    1290:	cd 40                	int    $0x40
    1292:	c3                   	ret    

00001293 <exit>:
SYSCALL(exit)
    1293:	b8 02 00 00 00       	mov    $0x2,%eax
    1298:	cd 40                	int    $0x40
    129a:	c3                   	ret    

0000129b <wait>:
SYSCALL(wait)
    129b:	b8 03 00 00 00       	mov    $0x3,%eax
    12a0:	cd 40                	int    $0x40
    12a2:	c3                   	ret    

000012a3 <pipe>:
SYSCALL(pipe)
    12a3:	b8 04 00 00 00       	mov    $0x4,%eax
    12a8:	cd 40                	int    $0x40
    12aa:	c3                   	ret    

000012ab <read>:
SYSCALL(read)
    12ab:	b8 05 00 00 00       	mov    $0x5,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <write>:
SYSCALL(write)
    12b3:	b8 10 00 00 00       	mov    $0x10,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <close>:
SYSCALL(close)
    12bb:	b8 15 00 00 00       	mov    $0x15,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <kill>:
SYSCALL(kill)
    12c3:	b8 06 00 00 00       	mov    $0x6,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <exec>:
SYSCALL(exec)
    12cb:	b8 07 00 00 00       	mov    $0x7,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <open>:
SYSCALL(open)
    12d3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <mknod>:
SYSCALL(mknod)
    12db:	b8 11 00 00 00       	mov    $0x11,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <unlink>:
SYSCALL(unlink)
    12e3:	b8 12 00 00 00       	mov    $0x12,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <fstat>:
SYSCALL(fstat)
    12eb:	b8 08 00 00 00       	mov    $0x8,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <link>:
SYSCALL(link)
    12f3:	b8 13 00 00 00       	mov    $0x13,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <mkdir>:
SYSCALL(mkdir)
    12fb:	b8 14 00 00 00       	mov    $0x14,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <chdir>:
SYSCALL(chdir)
    1303:	b8 09 00 00 00       	mov    $0x9,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <dup>:
SYSCALL(dup)
    130b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <getpid>:
SYSCALL(getpid)
    1313:	b8 0b 00 00 00       	mov    $0xb,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <sbrk>:
SYSCALL(sbrk)
    131b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <sleep>:
SYSCALL(sleep)
    1323:	b8 0d 00 00 00       	mov    $0xd,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <uptime>:
SYSCALL(uptime)
    132b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    
    1333:	66 90                	xchg   %ax,%ax
    1335:	66 90                	xchg   %ax,%ax
    1337:	66 90                	xchg   %ax,%ax
    1339:	66 90                	xchg   %ax,%ax
    133b:	66 90                	xchg   %ax,%ax
    133d:	66 90                	xchg   %ax,%ax
    133f:	90                   	nop

00001340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
    1345:	53                   	push   %ebx
    1346:	83 ec 3c             	sub    $0x3c,%esp
    1349:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    134c:	89 d1                	mov    %edx,%ecx
{
    134e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1351:	85 d2                	test   %edx,%edx
    1353:	0f 89 7f 00 00 00    	jns    13d8 <printint+0x98>
    1359:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    135d:	74 79                	je     13d8 <printint+0x98>
    neg = 1;
    135f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1366:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1368:	31 db                	xor    %ebx,%ebx
    136a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    136d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1370:	89 c8                	mov    %ecx,%eax
    1372:	31 d2                	xor    %edx,%edx
    1374:	89 cf                	mov    %ecx,%edi
    1376:	f7 75 c4             	divl   -0x3c(%ebp)
    1379:	0f b6 92 b0 17 00 00 	movzbl 0x17b0(%edx),%edx
    1380:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1383:	89 d8                	mov    %ebx,%eax
    1385:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1388:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    138b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    138e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1391:	76 dd                	jbe    1370 <printint+0x30>
  if(neg)
    1393:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1396:	85 c9                	test   %ecx,%ecx
    1398:	74 0c                	je     13a6 <printint+0x66>
    buf[i++] = '-';
    139a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    139f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13ad:	eb 07                	jmp    13b6 <printint+0x76>
    13af:	90                   	nop
    putc(fd, buf[i]);
    13b0:	0f b6 13             	movzbl (%ebx),%edx
    13b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13b6:	83 ec 04             	sub    $0x4,%esp
    13b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13bc:	6a 01                	push   $0x1
    13be:	56                   	push   %esi
    13bf:	57                   	push   %edi
    13c0:	e8 ee fe ff ff       	call   12b3 <write>
  while(--i >= 0)
    13c5:	83 c4 10             	add    $0x10,%esp
    13c8:	39 de                	cmp    %ebx,%esi
    13ca:	75 e4                	jne    13b0 <printint+0x70>
}
    13cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13cf:	5b                   	pop    %ebx
    13d0:	5e                   	pop    %esi
    13d1:	5f                   	pop    %edi
    13d2:	5d                   	pop    %ebp
    13d3:	c3                   	ret    
    13d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13df:	eb 87                	jmp    1368 <printint+0x28>
    13e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ef:	90                   	nop

000013f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
    13f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    13fc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    13ff:	0f b6 13             	movzbl (%ebx),%edx
    1402:	84 d2                	test   %dl,%dl
    1404:	74 6a                	je     1470 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1406:	8d 45 10             	lea    0x10(%ebp),%eax
    1409:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    140c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    140f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1411:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1414:	eb 36                	jmp    144c <printf+0x5c>
    1416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    141d:	8d 76 00             	lea    0x0(%esi),%esi
    1420:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1423:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1428:	83 f8 25             	cmp    $0x25,%eax
    142b:	74 15                	je     1442 <printf+0x52>
  write(fd, &c, 1);
    142d:	83 ec 04             	sub    $0x4,%esp
    1430:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1433:	6a 01                	push   $0x1
    1435:	57                   	push   %edi
    1436:	56                   	push   %esi
    1437:	e8 77 fe ff ff       	call   12b3 <write>
    143c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    143f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1442:	0f b6 13             	movzbl (%ebx),%edx
    1445:	83 c3 01             	add    $0x1,%ebx
    1448:	84 d2                	test   %dl,%dl
    144a:	74 24                	je     1470 <printf+0x80>
    c = fmt[i] & 0xff;
    144c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    144f:	85 c9                	test   %ecx,%ecx
    1451:	74 cd                	je     1420 <printf+0x30>
      }
    } else if(state == '%'){
    1453:	83 f9 25             	cmp    $0x25,%ecx
    1456:	75 ea                	jne    1442 <printf+0x52>
      if(c == 'd'){
    1458:	83 f8 25             	cmp    $0x25,%eax
    145b:	0f 84 07 01 00 00    	je     1568 <printf+0x178>
    1461:	83 e8 63             	sub    $0x63,%eax
    1464:	83 f8 15             	cmp    $0x15,%eax
    1467:	77 17                	ja     1480 <printf+0x90>
    1469:	ff 24 85 58 17 00 00 	jmp    *0x1758(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1470:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1473:	5b                   	pop    %ebx
    1474:	5e                   	pop    %esi
    1475:	5f                   	pop    %edi
    1476:	5d                   	pop    %ebp
    1477:	c3                   	ret    
    1478:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    147f:	90                   	nop
  write(fd, &c, 1);
    1480:	83 ec 04             	sub    $0x4,%esp
    1483:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1486:	6a 01                	push   $0x1
    1488:	57                   	push   %edi
    1489:	56                   	push   %esi
    148a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    148e:	e8 20 fe ff ff       	call   12b3 <write>
        putc(fd, c);
    1493:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1497:	83 c4 0c             	add    $0xc,%esp
    149a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    149d:	6a 01                	push   $0x1
    149f:	57                   	push   %edi
    14a0:	56                   	push   %esi
    14a1:	e8 0d fe ff ff       	call   12b3 <write>
        putc(fd, c);
    14a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14a9:	31 c9                	xor    %ecx,%ecx
    14ab:	eb 95                	jmp    1442 <printf+0x52>
    14ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14b0:	83 ec 0c             	sub    $0xc,%esp
    14b3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14b8:	6a 00                	push   $0x0
    14ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14bd:	8b 10                	mov    (%eax),%edx
    14bf:	89 f0                	mov    %esi,%eax
    14c1:	e8 7a fe ff ff       	call   1340 <printint>
        ap++;
    14c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    14ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14cd:	31 c9                	xor    %ecx,%ecx
    14cf:	e9 6e ff ff ff       	jmp    1442 <printf+0x52>
    14d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    14d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14db:	8b 10                	mov    (%eax),%edx
        ap++;
    14dd:	83 c0 04             	add    $0x4,%eax
    14e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    14e3:	85 d2                	test   %edx,%edx
    14e5:	0f 84 8d 00 00 00    	je     1578 <printf+0x188>
        while(*s != 0){
    14eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    14ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    14f0:	84 c0                	test   %al,%al
    14f2:	0f 84 4a ff ff ff    	je     1442 <printf+0x52>
    14f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    14fb:	89 d3                	mov    %edx,%ebx
    14fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1500:	83 ec 04             	sub    $0x4,%esp
          s++;
    1503:	83 c3 01             	add    $0x1,%ebx
    1506:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1509:	6a 01                	push   $0x1
    150b:	57                   	push   %edi
    150c:	56                   	push   %esi
    150d:	e8 a1 fd ff ff       	call   12b3 <write>
        while(*s != 0){
    1512:	0f b6 03             	movzbl (%ebx),%eax
    1515:	83 c4 10             	add    $0x10,%esp
    1518:	84 c0                	test   %al,%al
    151a:	75 e4                	jne    1500 <printf+0x110>
      state = 0;
    151c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    151f:	31 c9                	xor    %ecx,%ecx
    1521:	e9 1c ff ff ff       	jmp    1442 <printf+0x52>
    1526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1530:	83 ec 0c             	sub    $0xc,%esp
    1533:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1538:	6a 01                	push   $0x1
    153a:	e9 7b ff ff ff       	jmp    14ba <printf+0xca>
    153f:	90                   	nop
        putc(fd, *ap);
    1540:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1543:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1546:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1548:	6a 01                	push   $0x1
    154a:	57                   	push   %edi
    154b:	56                   	push   %esi
        putc(fd, *ap);
    154c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    154f:	e8 5f fd ff ff       	call   12b3 <write>
        ap++;
    1554:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1558:	83 c4 10             	add    $0x10,%esp
      state = 0;
    155b:	31 c9                	xor    %ecx,%ecx
    155d:	e9 e0 fe ff ff       	jmp    1442 <printf+0x52>
    1562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1568:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    156b:	83 ec 04             	sub    $0x4,%esp
    156e:	e9 2a ff ff ff       	jmp    149d <printf+0xad>
    1573:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1577:	90                   	nop
          s = "(null)";
    1578:	ba 50 17 00 00       	mov    $0x1750,%edx
        while(*s != 0){
    157d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1580:	b8 28 00 00 00       	mov    $0x28,%eax
    1585:	89 d3                	mov    %edx,%ebx
    1587:	e9 74 ff ff ff       	jmp    1500 <printf+0x110>
    158c:	66 90                	xchg   %ax,%ax
    158e:	66 90                	xchg   %ax,%ax

00001590 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1590:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1591:	a1 58 1a 00 00       	mov    0x1a58,%eax
{
    1596:	89 e5                	mov    %esp,%ebp
    1598:	57                   	push   %edi
    1599:	56                   	push   %esi
    159a:	53                   	push   %ebx
    159b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    159e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15a8:	89 c2                	mov    %eax,%edx
    15aa:	8b 00                	mov    (%eax),%eax
    15ac:	39 ca                	cmp    %ecx,%edx
    15ae:	73 30                	jae    15e0 <free+0x50>
    15b0:	39 c1                	cmp    %eax,%ecx
    15b2:	72 04                	jb     15b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15b4:	39 c2                	cmp    %eax,%edx
    15b6:	72 f0                	jb     15a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15be:	39 f8                	cmp    %edi,%eax
    15c0:	74 30                	je     15f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    15c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15c5:	8b 42 04             	mov    0x4(%edx),%eax
    15c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    15cb:	39 f1                	cmp    %esi,%ecx
    15cd:	74 3a                	je     1609 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    15cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    15d1:	5b                   	pop    %ebx
  freep = p;
    15d2:	89 15 58 1a 00 00    	mov    %edx,0x1a58
}
    15d8:	5e                   	pop    %esi
    15d9:	5f                   	pop    %edi
    15da:	5d                   	pop    %ebp
    15db:	c3                   	ret    
    15dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15e0:	39 c2                	cmp    %eax,%edx
    15e2:	72 c4                	jb     15a8 <free+0x18>
    15e4:	39 c1                	cmp    %eax,%ecx
    15e6:	73 c0                	jae    15a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    15e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15ee:	39 f8                	cmp    %edi,%eax
    15f0:	75 d0                	jne    15c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    15f2:	03 70 04             	add    0x4(%eax),%esi
    15f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15f8:	8b 02                	mov    (%edx),%eax
    15fa:	8b 00                	mov    (%eax),%eax
    15fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    15ff:	8b 42 04             	mov    0x4(%edx),%eax
    1602:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1605:	39 f1                	cmp    %esi,%ecx
    1607:	75 c6                	jne    15cf <free+0x3f>
    p->s.size += bp->s.size;
    1609:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    160c:	89 15 58 1a 00 00    	mov    %edx,0x1a58
    p->s.size += bp->s.size;
    1612:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1615:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1618:	89 0a                	mov    %ecx,(%edx)
}
    161a:	5b                   	pop    %ebx
    161b:	5e                   	pop    %esi
    161c:	5f                   	pop    %edi
    161d:	5d                   	pop    %ebp
    161e:	c3                   	ret    
    161f:	90                   	nop

00001620 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
    1625:	53                   	push   %ebx
    1626:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1629:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    162c:	8b 3d 58 1a 00 00    	mov    0x1a58,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1632:	8d 70 07             	lea    0x7(%eax),%esi
    1635:	c1 ee 03             	shr    $0x3,%esi
    1638:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    163b:	85 ff                	test   %edi,%edi
    163d:	0f 84 9d 00 00 00    	je     16e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1643:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1645:	8b 4a 04             	mov    0x4(%edx),%ecx
    1648:	39 f1                	cmp    %esi,%ecx
    164a:	73 6a                	jae    16b6 <malloc+0x96>
    164c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1651:	39 de                	cmp    %ebx,%esi
    1653:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1656:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    165d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1660:	eb 17                	jmp    1679 <malloc+0x59>
    1662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1668:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    166a:	8b 48 04             	mov    0x4(%eax),%ecx
    166d:	39 f1                	cmp    %esi,%ecx
    166f:	73 4f                	jae    16c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1671:	8b 3d 58 1a 00 00    	mov    0x1a58,%edi
    1677:	89 c2                	mov    %eax,%edx
    1679:	39 d7                	cmp    %edx,%edi
    167b:	75 eb                	jne    1668 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    167d:	83 ec 0c             	sub    $0xc,%esp
    1680:	ff 75 e4             	pushl  -0x1c(%ebp)
    1683:	e8 93 fc ff ff       	call   131b <sbrk>
  if(p == (char*)-1)
    1688:	83 c4 10             	add    $0x10,%esp
    168b:	83 f8 ff             	cmp    $0xffffffff,%eax
    168e:	74 1c                	je     16ac <malloc+0x8c>
  hp->s.size = nu;
    1690:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1693:	83 ec 0c             	sub    $0xc,%esp
    1696:	83 c0 08             	add    $0x8,%eax
    1699:	50                   	push   %eax
    169a:	e8 f1 fe ff ff       	call   1590 <free>
  return freep;
    169f:	8b 15 58 1a 00 00    	mov    0x1a58,%edx
      if((p = morecore(nunits)) == 0)
    16a5:	83 c4 10             	add    $0x10,%esp
    16a8:	85 d2                	test   %edx,%edx
    16aa:	75 bc                	jne    1668 <malloc+0x48>
        return 0;
  }
}
    16ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16af:	31 c0                	xor    %eax,%eax
}
    16b1:	5b                   	pop    %ebx
    16b2:	5e                   	pop    %esi
    16b3:	5f                   	pop    %edi
    16b4:	5d                   	pop    %ebp
    16b5:	c3                   	ret    
    if(p->s.size >= nunits){
    16b6:	89 d0                	mov    %edx,%eax
    16b8:	89 fa                	mov    %edi,%edx
    16ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    16c0:	39 ce                	cmp    %ecx,%esi
    16c2:	74 4c                	je     1710 <malloc+0xf0>
        p->s.size -= nunits;
    16c4:	29 f1                	sub    %esi,%ecx
    16c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    16c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    16cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    16cf:	89 15 58 1a 00 00    	mov    %edx,0x1a58
}
    16d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    16d8:	83 c0 08             	add    $0x8,%eax
}
    16db:	5b                   	pop    %ebx
    16dc:	5e                   	pop    %esi
    16dd:	5f                   	pop    %edi
    16de:	5d                   	pop    %ebp
    16df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    16e0:	c7 05 58 1a 00 00 5c 	movl   $0x1a5c,0x1a58
    16e7:	1a 00 00 
    base.s.size = 0;
    16ea:	bf 5c 1a 00 00       	mov    $0x1a5c,%edi
    base.s.ptr = freep = prevp = &base;
    16ef:	c7 05 5c 1a 00 00 5c 	movl   $0x1a5c,0x1a5c
    16f6:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    16fb:	c7 05 60 1a 00 00 00 	movl   $0x0,0x1a60
    1702:	00 00 00 
    if(p->s.size >= nunits){
    1705:	e9 42 ff ff ff       	jmp    164c <malloc+0x2c>
    170a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1710:	8b 08                	mov    (%eax),%ecx
    1712:	89 0a                	mov    %ecx,(%edx)
    1714:	eb b9                	jmp    16cf <malloc+0xaf>
