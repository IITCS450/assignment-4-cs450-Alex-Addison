
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	bb 01 00 00 00       	mov    $0x1,%ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 31                	mov    (%ecx),%esi
    101b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
    101e:	83 fe 01             	cmp    $0x1,%esi
    1021:	7e 27                	jle    104a <main+0x4a>
    1023:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1027:	90                   	nop
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
    1028:	83 ec 0c             	sub    $0xc,%esp
    102b:	ff 34 9f             	pushl  (%edi,%ebx,4)
  for(i=1; i<argc; i++)
    102e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
    1031:	e8 0a 02 00 00       	call   1240 <atoi>
    1036:	89 04 24             	mov    %eax,(%esp)
    1039:	e8 a5 02 00 00       	call   12e3 <kill>
  for(i=1; i<argc; i++)
    103e:	83 c4 10             	add    $0x10,%esp
    1041:	39 de                	cmp    %ebx,%esi
    1043:	75 e3                	jne    1028 <main+0x28>
  exit();
    1045:	e8 69 02 00 00       	call   12b3 <exit>
    printf(2, "usage: kill pid...\n");
    104a:	50                   	push   %eax
    104b:	50                   	push   %eax
    104c:	68 38 17 00 00       	push   $0x1738
    1051:	6a 02                	push   $0x2
    1053:	e8 b8 03 00 00       	call   1410 <printf>
    exit();
    1058:	e8 56 02 00 00       	call   12b3 <exit>
    105d:	66 90                	xchg   %ax,%ax
    105f:	90                   	nop

00001060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1060:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1061:	31 c0                	xor    %eax,%eax
{
    1063:	89 e5                	mov    %esp,%ebp
    1065:	53                   	push   %ebx
    1066:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1069:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1070:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1074:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1077:	83 c0 01             	add    $0x1,%eax
    107a:	84 d2                	test   %dl,%dl
    107c:	75 f2                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    107e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1081:	89 c8                	mov    %ecx,%eax
    1083:	c9                   	leave  
    1084:	c3                   	ret    
    1085:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 55 08             	mov    0x8(%ebp),%edx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	84 c0                	test   %al,%al
    109f:	75 17                	jne    10b8 <strcmp+0x28>
    10a1:	eb 3a                	jmp    10dd <strcmp+0x4d>
    10a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10a7:	90                   	nop
    10a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10ac:	83 c2 01             	add    $0x1,%edx
    10af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10b2:	84 c0                	test   %al,%al
    10b4:	74 1a                	je     10d0 <strcmp+0x40>
    p++, q++;
    10b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10b8:	0f b6 19             	movzbl (%ecx),%ebx
    10bb:	38 c3                	cmp    %al,%bl
    10bd:	74 e9                	je     10a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10bf:	29 d8                	sub    %ebx,%eax
}
    10c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10c4:	c9                   	leave  
    10c5:	c3                   	ret    
    10c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10d4:	31 c0                	xor    %eax,%eax
    10d6:	29 d8                	sub    %ebx,%eax
}
    10d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10db:	c9                   	leave  
    10dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10dd:	0f b6 19             	movzbl (%ecx),%ebx
    10e0:	31 c0                	xor    %eax,%eax
    10e2:	eb db                	jmp    10bf <strcmp+0x2f>
    10e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop

000010f0 <strlen>:

uint
strlen(const char *s)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10f6:	80 3a 00             	cmpb   $0x0,(%edx)
    10f9:	74 15                	je     1110 <strlen+0x20>
    10fb:	31 c0                	xor    %eax,%eax
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	83 c0 01             	add    $0x1,%eax
    1103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1107:	89 c1                	mov    %eax,%ecx
    1109:	75 f5                	jne    1100 <strlen+0x10>
    ;
  return n;
}
    110b:	89 c8                	mov    %ecx,%eax
    110d:	5d                   	pop    %ebp
    110e:	c3                   	ret    
    110f:	90                   	nop
  for(n = 0; s[n]; n++)
    1110:	31 c9                	xor    %ecx,%ecx
}
    1112:	5d                   	pop    %ebp
    1113:	89 c8                	mov    %ecx,%eax
    1115:	c3                   	ret    
    1116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111d:	8d 76 00             	lea    0x0(%esi),%esi

00001120 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1127:	8b 4d 10             	mov    0x10(%ebp),%ecx
    112a:	8b 45 0c             	mov    0xc(%ebp),%eax
    112d:	89 d7                	mov    %edx,%edi
    112f:	fc                   	cld    
    1130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1132:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1135:	89 d0                	mov    %edx,%eax
    1137:	c9                   	leave  
    1138:	c3                   	ret    
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001140 <strchr>:

char*
strchr(const char *s, char c)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 45 08             	mov    0x8(%ebp),%eax
    1146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    114a:	0f b6 10             	movzbl (%eax),%edx
    114d:	84 d2                	test   %dl,%dl
    114f:	75 12                	jne    1163 <strchr+0x23>
    1151:	eb 1d                	jmp    1170 <strchr+0x30>
    1153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1157:	90                   	nop
    1158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    115c:	83 c0 01             	add    $0x1,%eax
    115f:	84 d2                	test   %dl,%dl
    1161:	74 0d                	je     1170 <strchr+0x30>
    if(*s == c)
    1163:	38 d1                	cmp    %dl,%cl
    1165:	75 f1                	jne    1158 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1167:	5d                   	pop    %ebp
    1168:	c3                   	ret    
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1170:	31 c0                	xor    %eax,%eax
}
    1172:	5d                   	pop    %ebp
    1173:	c3                   	ret    
    1174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop

00001180 <gets>:

char*
gets(char *buf, int max)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    1188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1189:	31 db                	xor    %ebx,%ebx
{
    118b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    118e:	eb 27                	jmp    11b7 <gets+0x37>
    cc = read(0, &c, 1);
    1190:	83 ec 04             	sub    $0x4,%esp
    1193:	6a 01                	push   $0x1
    1195:	57                   	push   %edi
    1196:	6a 00                	push   $0x0
    1198:	e8 2e 01 00 00       	call   12cb <read>
    if(cc < 1)
    119d:	83 c4 10             	add    $0x10,%esp
    11a0:	85 c0                	test   %eax,%eax
    11a2:	7e 1d                	jle    11c1 <gets+0x41>
      break;
    buf[i++] = c;
    11a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11a8:	8b 55 08             	mov    0x8(%ebp),%edx
    11ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11af:	3c 0a                	cmp    $0xa,%al
    11b1:	74 1d                	je     11d0 <gets+0x50>
    11b3:	3c 0d                	cmp    $0xd,%al
    11b5:	74 19                	je     11d0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11b7:	89 de                	mov    %ebx,%esi
    11b9:	83 c3 01             	add    $0x1,%ebx
    11bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11bf:	7c cf                	jl     1190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11c1:	8b 45 08             	mov    0x8(%ebp),%eax
    11c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11cb:	5b                   	pop    %ebx
    11cc:	5e                   	pop    %esi
    11cd:	5f                   	pop    %edi
    11ce:	5d                   	pop    %ebp
    11cf:	c3                   	ret    
  buf[i] = '\0';
    11d0:	8b 45 08             	mov    0x8(%ebp),%eax
    11d3:	89 de                	mov    %ebx,%esi
    11d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11dc:	5b                   	pop    %ebx
    11dd:	5e                   	pop    %esi
    11de:	5f                   	pop    %edi
    11df:	5d                   	pop    %ebp
    11e0:	c3                   	ret    
    11e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ef:	90                   	nop

000011f0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	6a 00                	push   $0x0
    11fa:	ff 75 08             	pushl  0x8(%ebp)
    11fd:	e8 f1 00 00 00       	call   12f3 <open>
  if(fd < 0)
    1202:	83 c4 10             	add    $0x10,%esp
    1205:	85 c0                	test   %eax,%eax
    1207:	78 27                	js     1230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	ff 75 0c             	pushl  0xc(%ebp)
    120f:	89 c3                	mov    %eax,%ebx
    1211:	50                   	push   %eax
    1212:	e8 f4 00 00 00       	call   130b <fstat>
  close(fd);
    1217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    121a:	89 c6                	mov    %eax,%esi
  close(fd);
    121c:	e8 ba 00 00 00       	call   12db <close>
  return r;
    1221:	83 c4 10             	add    $0x10,%esp
}
    1224:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1227:	89 f0                	mov    %esi,%eax
    1229:	5b                   	pop    %ebx
    122a:	5e                   	pop    %esi
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1230:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1235:	eb ed                	jmp    1224 <stat+0x34>
    1237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123e:	66 90                	xchg   %ax,%ax

00001240 <atoi>:

int
atoi(const char *s)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1247:	0f be 02             	movsbl (%edx),%eax
    124a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    124d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1255:	77 1e                	ja     1275 <atoi+0x35>
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1260:	83 c2 01             	add    $0x1,%edx
    1263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    126a:	0f be 02             	movsbl (%edx),%eax
    126d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1270:	80 fb 09             	cmp    $0x9,%bl
    1273:	76 eb                	jbe    1260 <atoi+0x20>
  return n;
}
    1275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1278:	89 c8                	mov    %ecx,%eax
    127a:	c9                   	leave  
    127b:	c3                   	ret    
    127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	57                   	push   %edi
    1284:	8b 45 10             	mov    0x10(%ebp),%eax
    1287:	8b 55 08             	mov    0x8(%ebp),%edx
    128a:	56                   	push   %esi
    128b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    128e:	85 c0                	test   %eax,%eax
    1290:	7e 13                	jle    12a5 <memmove+0x25>
    1292:	01 d0                	add    %edx,%eax
  dst = vdst;
    1294:	89 d7                	mov    %edx,%edi
    1296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    129d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12a1:	39 f8                	cmp    %edi,%eax
    12a3:	75 fb                	jne    12a0 <memmove+0x20>
  return vdst;
}
    12a5:	5e                   	pop    %esi
    12a6:	89 d0                	mov    %edx,%eax
    12a8:	5f                   	pop    %edi
    12a9:	5d                   	pop    %ebp
    12aa:	c3                   	ret    

000012ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12ab:	b8 01 00 00 00       	mov    $0x1,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <exit>:
SYSCALL(exit)
    12b3:	b8 02 00 00 00       	mov    $0x2,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <wait>:
SYSCALL(wait)
    12bb:	b8 03 00 00 00       	mov    $0x3,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <pipe>:
SYSCALL(pipe)
    12c3:	b8 04 00 00 00       	mov    $0x4,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <read>:
SYSCALL(read)
    12cb:	b8 05 00 00 00       	mov    $0x5,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <write>:
SYSCALL(write)
    12d3:	b8 10 00 00 00       	mov    $0x10,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <close>:
SYSCALL(close)
    12db:	b8 15 00 00 00       	mov    $0x15,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <kill>:
SYSCALL(kill)
    12e3:	b8 06 00 00 00       	mov    $0x6,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <exec>:
SYSCALL(exec)
    12eb:	b8 07 00 00 00       	mov    $0x7,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <open>:
SYSCALL(open)
    12f3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <mknod>:
SYSCALL(mknod)
    12fb:	b8 11 00 00 00       	mov    $0x11,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <unlink>:
SYSCALL(unlink)
    1303:	b8 12 00 00 00       	mov    $0x12,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <fstat>:
SYSCALL(fstat)
    130b:	b8 08 00 00 00       	mov    $0x8,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <link>:
SYSCALL(link)
    1313:	b8 13 00 00 00       	mov    $0x13,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <mkdir>:
SYSCALL(mkdir)
    131b:	b8 14 00 00 00       	mov    $0x14,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <chdir>:
SYSCALL(chdir)
    1323:	b8 09 00 00 00       	mov    $0x9,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <dup>:
SYSCALL(dup)
    132b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <getpid>:
SYSCALL(getpid)
    1333:	b8 0b 00 00 00       	mov    $0xb,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <sbrk>:
SYSCALL(sbrk)
    133b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <sleep>:
SYSCALL(sleep)
    1343:	b8 0d 00 00 00       	mov    $0xd,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <uptime>:
SYSCALL(uptime)
    134b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    
    1353:	66 90                	xchg   %ax,%ax
    1355:	66 90                	xchg   %ax,%ax
    1357:	66 90                	xchg   %ax,%ax
    1359:	66 90                	xchg   %ax,%ax
    135b:	66 90                	xchg   %ax,%ax
    135d:	66 90                	xchg   %ax,%ax
    135f:	90                   	nop

00001360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	56                   	push   %esi
    1365:	53                   	push   %ebx
    1366:	83 ec 3c             	sub    $0x3c,%esp
    1369:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    136c:	89 d1                	mov    %edx,%ecx
{
    136e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1371:	85 d2                	test   %edx,%edx
    1373:	0f 89 7f 00 00 00    	jns    13f8 <printint+0x98>
    1379:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    137d:	74 79                	je     13f8 <printint+0x98>
    neg = 1;
    137f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1386:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1388:	31 db                	xor    %ebx,%ebx
    138a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    138d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1390:	89 c8                	mov    %ecx,%eax
    1392:	31 d2                	xor    %edx,%edx
    1394:	89 cf                	mov    %ecx,%edi
    1396:	f7 75 c4             	divl   -0x3c(%ebp)
    1399:	0f b6 92 ac 17 00 00 	movzbl 0x17ac(%edx),%edx
    13a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13a3:	89 d8                	mov    %ebx,%eax
    13a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13b1:	76 dd                	jbe    1390 <printint+0x30>
  if(neg)
    13b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13b6:	85 c9                	test   %ecx,%ecx
    13b8:	74 0c                	je     13c6 <printint+0x66>
    buf[i++] = '-';
    13ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13cd:	eb 07                	jmp    13d6 <printint+0x76>
    13cf:	90                   	nop
    putc(fd, buf[i]);
    13d0:	0f b6 13             	movzbl (%ebx),%edx
    13d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13d6:	83 ec 04             	sub    $0x4,%esp
    13d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13dc:	6a 01                	push   $0x1
    13de:	56                   	push   %esi
    13df:	57                   	push   %edi
    13e0:	e8 ee fe ff ff       	call   12d3 <write>
  while(--i >= 0)
    13e5:	83 c4 10             	add    $0x10,%esp
    13e8:	39 de                	cmp    %ebx,%esi
    13ea:	75 e4                	jne    13d0 <printint+0x70>
}
    13ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13ef:	5b                   	pop    %ebx
    13f0:	5e                   	pop    %esi
    13f1:	5f                   	pop    %edi
    13f2:	5d                   	pop    %ebp
    13f3:	c3                   	ret    
    13f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13ff:	eb 87                	jmp    1388 <printint+0x28>
    1401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1408:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    140f:	90                   	nop

00001410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1419:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    141c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    141f:	0f b6 13             	movzbl (%ebx),%edx
    1422:	84 d2                	test   %dl,%dl
    1424:	74 6a                	je     1490 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1426:	8d 45 10             	lea    0x10(%ebp),%eax
    1429:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    142c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    142f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1431:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1434:	eb 36                	jmp    146c <printf+0x5c>
    1436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143d:	8d 76 00             	lea    0x0(%esi),%esi
    1440:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1443:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1448:	83 f8 25             	cmp    $0x25,%eax
    144b:	74 15                	je     1462 <printf+0x52>
  write(fd, &c, 1);
    144d:	83 ec 04             	sub    $0x4,%esp
    1450:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1453:	6a 01                	push   $0x1
    1455:	57                   	push   %edi
    1456:	56                   	push   %esi
    1457:	e8 77 fe ff ff       	call   12d3 <write>
    145c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    145f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1462:	0f b6 13             	movzbl (%ebx),%edx
    1465:	83 c3 01             	add    $0x1,%ebx
    1468:	84 d2                	test   %dl,%dl
    146a:	74 24                	je     1490 <printf+0x80>
    c = fmt[i] & 0xff;
    146c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    146f:	85 c9                	test   %ecx,%ecx
    1471:	74 cd                	je     1440 <printf+0x30>
      }
    } else if(state == '%'){
    1473:	83 f9 25             	cmp    $0x25,%ecx
    1476:	75 ea                	jne    1462 <printf+0x52>
      if(c == 'd'){
    1478:	83 f8 25             	cmp    $0x25,%eax
    147b:	0f 84 07 01 00 00    	je     1588 <printf+0x178>
    1481:	83 e8 63             	sub    $0x63,%eax
    1484:	83 f8 15             	cmp    $0x15,%eax
    1487:	77 17                	ja     14a0 <printf+0x90>
    1489:	ff 24 85 54 17 00 00 	jmp    *0x1754(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1490:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1493:	5b                   	pop    %ebx
    1494:	5e                   	pop    %esi
    1495:	5f                   	pop    %edi
    1496:	5d                   	pop    %ebp
    1497:	c3                   	ret    
    1498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149f:	90                   	nop
  write(fd, &c, 1);
    14a0:	83 ec 04             	sub    $0x4,%esp
    14a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    14a6:	6a 01                	push   $0x1
    14a8:	57                   	push   %edi
    14a9:	56                   	push   %esi
    14aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14ae:	e8 20 fe ff ff       	call   12d3 <write>
        putc(fd, c);
    14b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    14b7:	83 c4 0c             	add    $0xc,%esp
    14ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14bd:	6a 01                	push   $0x1
    14bf:	57                   	push   %edi
    14c0:	56                   	push   %esi
    14c1:	e8 0d fe ff ff       	call   12d3 <write>
        putc(fd, c);
    14c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14c9:	31 c9                	xor    %ecx,%ecx
    14cb:	eb 95                	jmp    1462 <printf+0x52>
    14cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14d0:	83 ec 0c             	sub    $0xc,%esp
    14d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14d8:	6a 00                	push   $0x0
    14da:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14dd:	8b 10                	mov    (%eax),%edx
    14df:	89 f0                	mov    %esi,%eax
    14e1:	e8 7a fe ff ff       	call   1360 <printint>
        ap++;
    14e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    14ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14ed:	31 c9                	xor    %ecx,%ecx
    14ef:	e9 6e ff ff ff       	jmp    1462 <printf+0x52>
    14f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    14f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14fb:	8b 10                	mov    (%eax),%edx
        ap++;
    14fd:	83 c0 04             	add    $0x4,%eax
    1500:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1503:	85 d2                	test   %edx,%edx
    1505:	0f 84 8d 00 00 00    	je     1598 <printf+0x188>
        while(*s != 0){
    150b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    150e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1510:	84 c0                	test   %al,%al
    1512:	0f 84 4a ff ff ff    	je     1462 <printf+0x52>
    1518:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    151b:	89 d3                	mov    %edx,%ebx
    151d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1520:	83 ec 04             	sub    $0x4,%esp
          s++;
    1523:	83 c3 01             	add    $0x1,%ebx
    1526:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1529:	6a 01                	push   $0x1
    152b:	57                   	push   %edi
    152c:	56                   	push   %esi
    152d:	e8 a1 fd ff ff       	call   12d3 <write>
        while(*s != 0){
    1532:	0f b6 03             	movzbl (%ebx),%eax
    1535:	83 c4 10             	add    $0x10,%esp
    1538:	84 c0                	test   %al,%al
    153a:	75 e4                	jne    1520 <printf+0x110>
      state = 0;
    153c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    153f:	31 c9                	xor    %ecx,%ecx
    1541:	e9 1c ff ff ff       	jmp    1462 <printf+0x52>
    1546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1550:	83 ec 0c             	sub    $0xc,%esp
    1553:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1558:	6a 01                	push   $0x1
    155a:	e9 7b ff ff ff       	jmp    14da <printf+0xca>
    155f:	90                   	nop
        putc(fd, *ap);
    1560:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1563:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1566:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1568:	6a 01                	push   $0x1
    156a:	57                   	push   %edi
    156b:	56                   	push   %esi
        putc(fd, *ap);
    156c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    156f:	e8 5f fd ff ff       	call   12d3 <write>
        ap++;
    1574:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1578:	83 c4 10             	add    $0x10,%esp
      state = 0;
    157b:	31 c9                	xor    %ecx,%ecx
    157d:	e9 e0 fe ff ff       	jmp    1462 <printf+0x52>
    1582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1588:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    158b:	83 ec 04             	sub    $0x4,%esp
    158e:	e9 2a ff ff ff       	jmp    14bd <printf+0xad>
    1593:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1597:	90                   	nop
          s = "(null)";
    1598:	ba 4c 17 00 00       	mov    $0x174c,%edx
        while(*s != 0){
    159d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15a0:	b8 28 00 00 00       	mov    $0x28,%eax
    15a5:	89 d3                	mov    %edx,%ebx
    15a7:	e9 74 ff ff ff       	jmp    1520 <printf+0x110>
    15ac:	66 90                	xchg   %ax,%ax
    15ae:	66 90                	xchg   %ax,%ax

000015b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15b1:	a1 64 1a 00 00       	mov    0x1a64,%eax
{
    15b6:	89 e5                	mov    %esp,%ebp
    15b8:	57                   	push   %edi
    15b9:	56                   	push   %esi
    15ba:	53                   	push   %ebx
    15bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15c8:	89 c2                	mov    %eax,%edx
    15ca:	8b 00                	mov    (%eax),%eax
    15cc:	39 ca                	cmp    %ecx,%edx
    15ce:	73 30                	jae    1600 <free+0x50>
    15d0:	39 c1                	cmp    %eax,%ecx
    15d2:	72 04                	jb     15d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15d4:	39 c2                	cmp    %eax,%edx
    15d6:	72 f0                	jb     15c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15de:	39 f8                	cmp    %edi,%eax
    15e0:	74 30                	je     1612 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    15e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    15e5:	8b 42 04             	mov    0x4(%edx),%eax
    15e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    15eb:	39 f1                	cmp    %esi,%ecx
    15ed:	74 3a                	je     1629 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    15ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    15f1:	5b                   	pop    %ebx
  freep = p;
    15f2:	89 15 64 1a 00 00    	mov    %edx,0x1a64
}
    15f8:	5e                   	pop    %esi
    15f9:	5f                   	pop    %edi
    15fa:	5d                   	pop    %ebp
    15fb:	c3                   	ret    
    15fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1600:	39 c2                	cmp    %eax,%edx
    1602:	72 c4                	jb     15c8 <free+0x18>
    1604:	39 c1                	cmp    %eax,%ecx
    1606:	73 c0                	jae    15c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1608:	8b 73 fc             	mov    -0x4(%ebx),%esi
    160b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    160e:	39 f8                	cmp    %edi,%eax
    1610:	75 d0                	jne    15e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1612:	03 70 04             	add    0x4(%eax),%esi
    1615:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1618:	8b 02                	mov    (%edx),%eax
    161a:	8b 00                	mov    (%eax),%eax
    161c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    161f:	8b 42 04             	mov    0x4(%edx),%eax
    1622:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1625:	39 f1                	cmp    %esi,%ecx
    1627:	75 c6                	jne    15ef <free+0x3f>
    p->s.size += bp->s.size;
    1629:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    162c:	89 15 64 1a 00 00    	mov    %edx,0x1a64
    p->s.size += bp->s.size;
    1632:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1635:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1638:	89 0a                	mov    %ecx,(%edx)
}
    163a:	5b                   	pop    %ebx
    163b:	5e                   	pop    %esi
    163c:	5f                   	pop    %edi
    163d:	5d                   	pop    %ebp
    163e:	c3                   	ret    
    163f:	90                   	nop

00001640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1640:	55                   	push   %ebp
    1641:	89 e5                	mov    %esp,%ebp
    1643:	57                   	push   %edi
    1644:	56                   	push   %esi
    1645:	53                   	push   %ebx
    1646:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1649:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    164c:	8b 3d 64 1a 00 00    	mov    0x1a64,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1652:	8d 70 07             	lea    0x7(%eax),%esi
    1655:	c1 ee 03             	shr    $0x3,%esi
    1658:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    165b:	85 ff                	test   %edi,%edi
    165d:	0f 84 9d 00 00 00    	je     1700 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1663:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1665:	8b 4a 04             	mov    0x4(%edx),%ecx
    1668:	39 f1                	cmp    %esi,%ecx
    166a:	73 6a                	jae    16d6 <malloc+0x96>
    166c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1671:	39 de                	cmp    %ebx,%esi
    1673:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1676:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    167d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1680:	eb 17                	jmp    1699 <malloc+0x59>
    1682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1688:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    168a:	8b 48 04             	mov    0x4(%eax),%ecx
    168d:	39 f1                	cmp    %esi,%ecx
    168f:	73 4f                	jae    16e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1691:	8b 3d 64 1a 00 00    	mov    0x1a64,%edi
    1697:	89 c2                	mov    %eax,%edx
    1699:	39 d7                	cmp    %edx,%edi
    169b:	75 eb                	jne    1688 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    169d:	83 ec 0c             	sub    $0xc,%esp
    16a0:	ff 75 e4             	pushl  -0x1c(%ebp)
    16a3:	e8 93 fc ff ff       	call   133b <sbrk>
  if(p == (char*)-1)
    16a8:	83 c4 10             	add    $0x10,%esp
    16ab:	83 f8 ff             	cmp    $0xffffffff,%eax
    16ae:	74 1c                	je     16cc <malloc+0x8c>
  hp->s.size = nu;
    16b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16b3:	83 ec 0c             	sub    $0xc,%esp
    16b6:	83 c0 08             	add    $0x8,%eax
    16b9:	50                   	push   %eax
    16ba:	e8 f1 fe ff ff       	call   15b0 <free>
  return freep;
    16bf:	8b 15 64 1a 00 00    	mov    0x1a64,%edx
      if((p = morecore(nunits)) == 0)
    16c5:	83 c4 10             	add    $0x10,%esp
    16c8:	85 d2                	test   %edx,%edx
    16ca:	75 bc                	jne    1688 <malloc+0x48>
        return 0;
  }
}
    16cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16cf:	31 c0                	xor    %eax,%eax
}
    16d1:	5b                   	pop    %ebx
    16d2:	5e                   	pop    %esi
    16d3:	5f                   	pop    %edi
    16d4:	5d                   	pop    %ebp
    16d5:	c3                   	ret    
    if(p->s.size >= nunits){
    16d6:	89 d0                	mov    %edx,%eax
    16d8:	89 fa                	mov    %edi,%edx
    16da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    16e0:	39 ce                	cmp    %ecx,%esi
    16e2:	74 4c                	je     1730 <malloc+0xf0>
        p->s.size -= nunits;
    16e4:	29 f1                	sub    %esi,%ecx
    16e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    16e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    16ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    16ef:	89 15 64 1a 00 00    	mov    %edx,0x1a64
}
    16f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    16f8:	83 c0 08             	add    $0x8,%eax
}
    16fb:	5b                   	pop    %ebx
    16fc:	5e                   	pop    %esi
    16fd:	5f                   	pop    %edi
    16fe:	5d                   	pop    %ebp
    16ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1700:	c7 05 64 1a 00 00 68 	movl   $0x1a68,0x1a64
    1707:	1a 00 00 
    base.s.size = 0;
    170a:	bf 68 1a 00 00       	mov    $0x1a68,%edi
    base.s.ptr = freep = prevp = &base;
    170f:	c7 05 68 1a 00 00 68 	movl   $0x1a68,0x1a68
    1716:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1719:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    171b:	c7 05 6c 1a 00 00 00 	movl   $0x0,0x1a6c
    1722:	00 00 00 
    if(p->s.size >= nunits){
    1725:	e9 42 ff ff ff       	jmp    166c <malloc+0x2c>
    172a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1730:	8b 08                	mov    (%eax),%ecx
    1732:	89 0a                	mov    %ecx,(%edx)
    1734:	eb b9                	jmp    16ef <malloc+0xaf>
