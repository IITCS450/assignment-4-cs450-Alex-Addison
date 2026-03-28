
_rm:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	bf 01 00 00 00       	mov    $0x1,%edi
    1013:	56                   	push   %esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	8b 59 04             	mov    0x4(%ecx),%ebx
    101c:	8b 31                	mov    (%ecx),%esi
    101e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
    1021:	83 fe 01             	cmp    $0x1,%esi
    1024:	7e 3e                	jle    1064 <main+0x64>
    1026:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	pushl  (%ebx)
    1035:	e8 e9 02 00 00       	call   1323 <unlink>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	85 c0                	test   %eax,%eax
    103f:	78 0f                	js     1050 <main+0x50>
  for(i = 1; i < argc; i++){
    1041:	83 c7 01             	add    $0x1,%edi
    1044:	83 c3 04             	add    $0x4,%ebx
    1047:	39 fe                	cmp    %edi,%esi
    1049:	75 e5                	jne    1030 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
    104b:	e8 83 02 00 00       	call   12d3 <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
    1050:	50                   	push   %eax
    1051:	ff 33                	pushl  (%ebx)
    1053:	68 6c 17 00 00       	push   $0x176c
    1058:	6a 02                	push   $0x2
    105a:	e8 d1 03 00 00       	call   1430 <printf>
      break;
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	eb e7                	jmp    104b <main+0x4b>
    printf(2, "Usage: rm files...\n");
    1064:	52                   	push   %edx
    1065:	52                   	push   %edx
    1066:	68 58 17 00 00       	push   $0x1758
    106b:	6a 02                	push   $0x2
    106d:	e8 be 03 00 00       	call   1430 <printf>
    exit();
    1072:	e8 5c 02 00 00       	call   12d3 <exit>
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1080:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1081:	31 c0                	xor    %eax,%eax
{
    1083:	89 e5                	mov    %esp,%ebp
    1085:	53                   	push   %ebx
    1086:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1089:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1090:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1094:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1097:	83 c0 01             	add    $0x1,%eax
    109a:	84 d2                	test   %dl,%dl
    109c:	75 f2                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    109e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10a1:	89 c8                	mov    %ecx,%eax
    10a3:	c9                   	leave  
    10a4:	c3                   	ret    
    10a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	8b 55 08             	mov    0x8(%ebp),%edx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	84 c0                	test   %al,%al
    10bf:	75 17                	jne    10d8 <strcmp+0x28>
    10c1:	eb 3a                	jmp    10fd <strcmp+0x4d>
    10c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10c7:	90                   	nop
    10c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    10cc:	83 c2 01             	add    $0x1,%edx
    10cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10d2:	84 c0                	test   %al,%al
    10d4:	74 1a                	je     10f0 <strcmp+0x40>
    p++, q++;
    10d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    10d8:	0f b6 19             	movzbl (%ecx),%ebx
    10db:	38 c3                	cmp    %al,%bl
    10dd:	74 e9                	je     10c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    10df:	29 d8                	sub    %ebx,%eax
}
    10e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10e4:	c9                   	leave  
    10e5:	c3                   	ret    
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    10f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10f4:	31 c0                	xor    %eax,%eax
    10f6:	29 d8                	sub    %ebx,%eax
}
    10f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10fb:	c9                   	leave  
    10fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    10fd:	0f b6 19             	movzbl (%ecx),%ebx
    1100:	31 c0                	xor    %eax,%eax
    1102:	eb db                	jmp    10df <strcmp+0x2f>
    1104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop

00001110 <strlen>:

uint
strlen(const char *s)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1116:	80 3a 00             	cmpb   $0x0,(%edx)
    1119:	74 15                	je     1130 <strlen+0x20>
    111b:	31 c0                	xor    %eax,%eax
    111d:	8d 76 00             	lea    0x0(%esi),%esi
    1120:	83 c0 01             	add    $0x1,%eax
    1123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1127:	89 c1                	mov    %eax,%ecx
    1129:	75 f5                	jne    1120 <strlen+0x10>
    ;
  return n;
}
    112b:	89 c8                	mov    %ecx,%eax
    112d:	5d                   	pop    %ebp
    112e:	c3                   	ret    
    112f:	90                   	nop
  for(n = 0; s[n]; n++)
    1130:	31 c9                	xor    %ecx,%ecx
}
    1132:	5d                   	pop    %ebp
    1133:	89 c8                	mov    %ecx,%eax
    1135:	c3                   	ret    
    1136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113d:	8d 76 00             	lea    0x0(%esi),%esi

00001140 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1147:	8b 4d 10             	mov    0x10(%ebp),%ecx
    114a:	8b 45 0c             	mov    0xc(%ebp),%eax
    114d:	89 d7                	mov    %edx,%edi
    114f:	fc                   	cld    
    1150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1152:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1155:	89 d0                	mov    %edx,%eax
    1157:	c9                   	leave  
    1158:	c3                   	ret    
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001160 <strchr>:

char*
strchr(const char *s, char c)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	8b 45 08             	mov    0x8(%ebp),%eax
    1166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    116a:	0f b6 10             	movzbl (%eax),%edx
    116d:	84 d2                	test   %dl,%dl
    116f:	75 12                	jne    1183 <strchr+0x23>
    1171:	eb 1d                	jmp    1190 <strchr+0x30>
    1173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1177:	90                   	nop
    1178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    117c:	83 c0 01             	add    $0x1,%eax
    117f:	84 d2                	test   %dl,%dl
    1181:	74 0d                	je     1190 <strchr+0x30>
    if(*s == c)
    1183:	38 d1                	cmp    %dl,%cl
    1185:	75 f1                	jne    1178 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1187:	5d                   	pop    %ebp
    1188:	c3                   	ret    
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1190:	31 c0                	xor    %eax,%eax
}
    1192:	5d                   	pop    %ebp
    1193:	c3                   	ret    
    1194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop

000011a0 <gets>:

char*
gets(char *buf, int max)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    11a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    11a9:	31 db                	xor    %ebx,%ebx
{
    11ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    11ae:	eb 27                	jmp    11d7 <gets+0x37>
    cc = read(0, &c, 1);
    11b0:	83 ec 04             	sub    $0x4,%esp
    11b3:	6a 01                	push   $0x1
    11b5:	57                   	push   %edi
    11b6:	6a 00                	push   $0x0
    11b8:	e8 2e 01 00 00       	call   12eb <read>
    if(cc < 1)
    11bd:	83 c4 10             	add    $0x10,%esp
    11c0:	85 c0                	test   %eax,%eax
    11c2:	7e 1d                	jle    11e1 <gets+0x41>
      break;
    buf[i++] = c;
    11c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c8:	8b 55 08             	mov    0x8(%ebp),%edx
    11cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11cf:	3c 0a                	cmp    $0xa,%al
    11d1:	74 1d                	je     11f0 <gets+0x50>
    11d3:	3c 0d                	cmp    $0xd,%al
    11d5:	74 19                	je     11f0 <gets+0x50>
  for(i=0; i+1 < max; ){
    11d7:	89 de                	mov    %ebx,%esi
    11d9:	83 c3 01             	add    $0x1,%ebx
    11dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11df:	7c cf                	jl     11b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11e1:	8b 45 08             	mov    0x8(%ebp),%eax
    11e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11eb:	5b                   	pop    %ebx
    11ec:	5e                   	pop    %esi
    11ed:	5f                   	pop    %edi
    11ee:	5d                   	pop    %ebp
    11ef:	c3                   	ret    
  buf[i] = '\0';
    11f0:	8b 45 08             	mov    0x8(%ebp),%eax
    11f3:	89 de                	mov    %ebx,%esi
    11f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    11f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fc:	5b                   	pop    %ebx
    11fd:	5e                   	pop    %esi
    11fe:	5f                   	pop    %edi
    11ff:	5d                   	pop    %ebp
    1200:	c3                   	ret    
    1201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120f:	90                   	nop

00001210 <stat>:

int
stat(const char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	pushl  0x8(%ebp)
    121d:	e8 f1 00 00 00       	call   1313 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	pushl  0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 f4 00 00 00       	call   132b <fstat>
  close(fd);
    1237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123a:	89 c6                	mov    %eax,%esi
  close(fd);
    123c:	e8 ba 00 00 00       	call   12fb <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
}
    1244:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1247:	89 f0                	mov    %esi,%eax
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1250:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1255:	eb ed                	jmp    1244 <stat+0x34>
    1257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    125e:	66 90                	xchg   %ax,%ax

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 02             	movsbl (%edx),%eax
    126a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    126d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1275:	77 1e                	ja     1295 <atoi+0x35>
    1277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    127e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1280:	83 c2 01             	add    $0x1,%edx
    1283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    128a:	0f be 02             	movsbl (%edx),%eax
    128d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1298:	89 c8                	mov    %ecx,%eax
    129a:	c9                   	leave  
    129b:	c3                   	ret    
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	8b 45 10             	mov    0x10(%ebp),%eax
    12a7:	8b 55 08             	mov    0x8(%ebp),%edx
    12aa:	56                   	push   %esi
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 c0                	test   %eax,%eax
    12b0:	7e 13                	jle    12c5 <memmove+0x25>
    12b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    12b4:	89 d7                	mov    %edx,%edi
    12b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12c1:	39 f8                	cmp    %edi,%eax
    12c3:	75 fb                	jne    12c0 <memmove+0x20>
  return vdst;
}
    12c5:	5e                   	pop    %esi
    12c6:	89 d0                	mov    %edx,%eax
    12c8:	5f                   	pop    %edi
    12c9:	5d                   	pop    %ebp
    12ca:	c3                   	ret    

000012cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12cb:	b8 01 00 00 00       	mov    $0x1,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <exit>:
SYSCALL(exit)
    12d3:	b8 02 00 00 00       	mov    $0x2,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <wait>:
SYSCALL(wait)
    12db:	b8 03 00 00 00       	mov    $0x3,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <pipe>:
SYSCALL(pipe)
    12e3:	b8 04 00 00 00       	mov    $0x4,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <read>:
SYSCALL(read)
    12eb:	b8 05 00 00 00       	mov    $0x5,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <write>:
SYSCALL(write)
    12f3:	b8 10 00 00 00       	mov    $0x10,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <close>:
SYSCALL(close)
    12fb:	b8 15 00 00 00       	mov    $0x15,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <kill>:
SYSCALL(kill)
    1303:	b8 06 00 00 00       	mov    $0x6,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <exec>:
SYSCALL(exec)
    130b:	b8 07 00 00 00       	mov    $0x7,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <open>:
SYSCALL(open)
    1313:	b8 0f 00 00 00       	mov    $0xf,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <mknod>:
SYSCALL(mknod)
    131b:	b8 11 00 00 00       	mov    $0x11,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <unlink>:
SYSCALL(unlink)
    1323:	b8 12 00 00 00       	mov    $0x12,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <fstat>:
SYSCALL(fstat)
    132b:	b8 08 00 00 00       	mov    $0x8,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <link>:
SYSCALL(link)
    1333:	b8 13 00 00 00       	mov    $0x13,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <mkdir>:
SYSCALL(mkdir)
    133b:	b8 14 00 00 00       	mov    $0x14,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <chdir>:
SYSCALL(chdir)
    1343:	b8 09 00 00 00       	mov    $0x9,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <dup>:
SYSCALL(dup)
    134b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <getpid>:
SYSCALL(getpid)
    1353:	b8 0b 00 00 00       	mov    $0xb,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <sbrk>:
SYSCALL(sbrk)
    135b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <sleep>:
SYSCALL(sleep)
    1363:	b8 0d 00 00 00       	mov    $0xd,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <uptime>:
SYSCALL(uptime)
    136b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    
    1373:	66 90                	xchg   %ax,%ax
    1375:	66 90                	xchg   %ax,%ax
    1377:	66 90                	xchg   %ax,%ax
    1379:	66 90                	xchg   %ax,%ax
    137b:	66 90                	xchg   %ax,%ax
    137d:	66 90                	xchg   %ax,%ax
    137f:	90                   	nop

00001380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	53                   	push   %ebx
    1386:	83 ec 3c             	sub    $0x3c,%esp
    1389:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    138c:	89 d1                	mov    %edx,%ecx
{
    138e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1391:	85 d2                	test   %edx,%edx
    1393:	0f 89 7f 00 00 00    	jns    1418 <printint+0x98>
    1399:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    139d:	74 79                	je     1418 <printint+0x98>
    neg = 1;
    139f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13a8:	31 db                	xor    %ebx,%ebx
    13aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13b0:	89 c8                	mov    %ecx,%eax
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	89 cf                	mov    %ecx,%edi
    13b6:	f7 75 c4             	divl   -0x3c(%ebp)
    13b9:	0f b6 92 e4 17 00 00 	movzbl 0x17e4(%edx),%edx
    13c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13c3:	89 d8                	mov    %ebx,%eax
    13c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13d1:	76 dd                	jbe    13b0 <printint+0x30>
  if(neg)
    13d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13d6:	85 c9                	test   %ecx,%ecx
    13d8:	74 0c                	je     13e6 <printint+0x66>
    buf[i++] = '-';
    13da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13ed:	eb 07                	jmp    13f6 <printint+0x76>
    13ef:	90                   	nop
    putc(fd, buf[i]);
    13f0:	0f b6 13             	movzbl (%ebx),%edx
    13f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13f6:	83 ec 04             	sub    $0x4,%esp
    13f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13fc:	6a 01                	push   $0x1
    13fe:	56                   	push   %esi
    13ff:	57                   	push   %edi
    1400:	e8 ee fe ff ff       	call   12f3 <write>
  while(--i >= 0)
    1405:	83 c4 10             	add    $0x10,%esp
    1408:	39 de                	cmp    %ebx,%esi
    140a:	75 e4                	jne    13f0 <printint+0x70>
}
    140c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    140f:	5b                   	pop    %ebx
    1410:	5e                   	pop    %esi
    1411:	5f                   	pop    %edi
    1412:	5d                   	pop    %ebp
    1413:	c3                   	ret    
    1414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1418:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    141f:	eb 87                	jmp    13a8 <printint+0x28>
    1421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    142f:	90                   	nop

00001430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1439:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    143c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    143f:	0f b6 13             	movzbl (%ebx),%edx
    1442:	84 d2                	test   %dl,%dl
    1444:	74 6a                	je     14b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1446:	8d 45 10             	lea    0x10(%ebp),%eax
    1449:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    144c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    144f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1451:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1454:	eb 36                	jmp    148c <printf+0x5c>
    1456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    145d:	8d 76 00             	lea    0x0(%esi),%esi
    1460:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1463:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1468:	83 f8 25             	cmp    $0x25,%eax
    146b:	74 15                	je     1482 <printf+0x52>
  write(fd, &c, 1);
    146d:	83 ec 04             	sub    $0x4,%esp
    1470:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1473:	6a 01                	push   $0x1
    1475:	57                   	push   %edi
    1476:	56                   	push   %esi
    1477:	e8 77 fe ff ff       	call   12f3 <write>
    147c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    147f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1482:	0f b6 13             	movzbl (%ebx),%edx
    1485:	83 c3 01             	add    $0x1,%ebx
    1488:	84 d2                	test   %dl,%dl
    148a:	74 24                	je     14b0 <printf+0x80>
    c = fmt[i] & 0xff;
    148c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    148f:	85 c9                	test   %ecx,%ecx
    1491:	74 cd                	je     1460 <printf+0x30>
      }
    } else if(state == '%'){
    1493:	83 f9 25             	cmp    $0x25,%ecx
    1496:	75 ea                	jne    1482 <printf+0x52>
      if(c == 'd'){
    1498:	83 f8 25             	cmp    $0x25,%eax
    149b:	0f 84 07 01 00 00    	je     15a8 <printf+0x178>
    14a1:	83 e8 63             	sub    $0x63,%eax
    14a4:	83 f8 15             	cmp    $0x15,%eax
    14a7:	77 17                	ja     14c0 <printf+0x90>
    14a9:	ff 24 85 8c 17 00 00 	jmp    *0x178c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b3:	5b                   	pop    %ebx
    14b4:	5e                   	pop    %esi
    14b5:	5f                   	pop    %edi
    14b6:	5d                   	pop    %ebp
    14b7:	c3                   	ret    
    14b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14bf:	90                   	nop
  write(fd, &c, 1);
    14c0:	83 ec 04             	sub    $0x4,%esp
    14c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    14c6:	6a 01                	push   $0x1
    14c8:	57                   	push   %edi
    14c9:	56                   	push   %esi
    14ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14ce:	e8 20 fe ff ff       	call   12f3 <write>
        putc(fd, c);
    14d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    14d7:	83 c4 0c             	add    $0xc,%esp
    14da:	88 55 e7             	mov    %dl,-0x19(%ebp)
    14dd:	6a 01                	push   $0x1
    14df:	57                   	push   %edi
    14e0:	56                   	push   %esi
    14e1:	e8 0d fe ff ff       	call   12f3 <write>
        putc(fd, c);
    14e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14e9:	31 c9                	xor    %ecx,%ecx
    14eb:	eb 95                	jmp    1482 <printf+0x52>
    14ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14f8:	6a 00                	push   $0x0
    14fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14fd:	8b 10                	mov    (%eax),%edx
    14ff:	89 f0                	mov    %esi,%eax
    1501:	e8 7a fe ff ff       	call   1380 <printint>
        ap++;
    1506:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    150a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    150d:	31 c9                	xor    %ecx,%ecx
    150f:	e9 6e ff ff ff       	jmp    1482 <printf+0x52>
    1514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1518:	8b 45 d0             	mov    -0x30(%ebp),%eax
    151b:	8b 10                	mov    (%eax),%edx
        ap++;
    151d:	83 c0 04             	add    $0x4,%eax
    1520:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1523:	85 d2                	test   %edx,%edx
    1525:	0f 84 8d 00 00 00    	je     15b8 <printf+0x188>
        while(*s != 0){
    152b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    152e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1530:	84 c0                	test   %al,%al
    1532:	0f 84 4a ff ff ff    	je     1482 <printf+0x52>
    1538:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    153b:	89 d3                	mov    %edx,%ebx
    153d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1540:	83 ec 04             	sub    $0x4,%esp
          s++;
    1543:	83 c3 01             	add    $0x1,%ebx
    1546:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1549:	6a 01                	push   $0x1
    154b:	57                   	push   %edi
    154c:	56                   	push   %esi
    154d:	e8 a1 fd ff ff       	call   12f3 <write>
        while(*s != 0){
    1552:	0f b6 03             	movzbl (%ebx),%eax
    1555:	83 c4 10             	add    $0x10,%esp
    1558:	84 c0                	test   %al,%al
    155a:	75 e4                	jne    1540 <printf+0x110>
      state = 0;
    155c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    155f:	31 c9                	xor    %ecx,%ecx
    1561:	e9 1c ff ff ff       	jmp    1482 <printf+0x52>
    1566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    156d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1570:	83 ec 0c             	sub    $0xc,%esp
    1573:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1578:	6a 01                	push   $0x1
    157a:	e9 7b ff ff ff       	jmp    14fa <printf+0xca>
    157f:	90                   	nop
        putc(fd, *ap);
    1580:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1583:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1586:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1588:	6a 01                	push   $0x1
    158a:	57                   	push   %edi
    158b:	56                   	push   %esi
        putc(fd, *ap);
    158c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    158f:	e8 5f fd ff ff       	call   12f3 <write>
        ap++;
    1594:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1598:	83 c4 10             	add    $0x10,%esp
      state = 0;
    159b:	31 c9                	xor    %ecx,%ecx
    159d:	e9 e0 fe ff ff       	jmp    1482 <printf+0x52>
    15a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    15a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    15ab:	83 ec 04             	sub    $0x4,%esp
    15ae:	e9 2a ff ff ff       	jmp    14dd <printf+0xad>
    15b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15b7:	90                   	nop
          s = "(null)";
    15b8:	ba 85 17 00 00       	mov    $0x1785,%edx
        while(*s != 0){
    15bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    15c0:	b8 28 00 00 00       	mov    $0x28,%eax
    15c5:	89 d3                	mov    %edx,%ebx
    15c7:	e9 74 ff ff ff       	jmp    1540 <printf+0x110>
    15cc:	66 90                	xchg   %ax,%ax
    15ce:	66 90                	xchg   %ax,%ax

000015d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d1:	a1 9c 1a 00 00       	mov    0x1a9c,%eax
{
    15d6:	89 e5                	mov    %esp,%ebp
    15d8:	57                   	push   %edi
    15d9:	56                   	push   %esi
    15da:	53                   	push   %ebx
    15db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15e8:	89 c2                	mov    %eax,%edx
    15ea:	8b 00                	mov    (%eax),%eax
    15ec:	39 ca                	cmp    %ecx,%edx
    15ee:	73 30                	jae    1620 <free+0x50>
    15f0:	39 c1                	cmp    %eax,%ecx
    15f2:	72 04                	jb     15f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f4:	39 c2                	cmp    %eax,%edx
    15f6:	72 f0                	jb     15e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15fe:	39 f8                	cmp    %edi,%eax
    1600:	74 30                	je     1632 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1602:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1605:	8b 42 04             	mov    0x4(%edx),%eax
    1608:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    160b:	39 f1                	cmp    %esi,%ecx
    160d:	74 3a                	je     1649 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    160f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1611:	5b                   	pop    %ebx
  freep = p;
    1612:	89 15 9c 1a 00 00    	mov    %edx,0x1a9c
}
    1618:	5e                   	pop    %esi
    1619:	5f                   	pop    %edi
    161a:	5d                   	pop    %ebp
    161b:	c3                   	ret    
    161c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1620:	39 c2                	cmp    %eax,%edx
    1622:	72 c4                	jb     15e8 <free+0x18>
    1624:	39 c1                	cmp    %eax,%ecx
    1626:	73 c0                	jae    15e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1628:	8b 73 fc             	mov    -0x4(%ebx),%esi
    162b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    162e:	39 f8                	cmp    %edi,%eax
    1630:	75 d0                	jne    1602 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1632:	03 70 04             	add    0x4(%eax),%esi
    1635:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1638:	8b 02                	mov    (%edx),%eax
    163a:	8b 00                	mov    (%eax),%eax
    163c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    163f:	8b 42 04             	mov    0x4(%edx),%eax
    1642:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1645:	39 f1                	cmp    %esi,%ecx
    1647:	75 c6                	jne    160f <free+0x3f>
    p->s.size += bp->s.size;
    1649:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    164c:	89 15 9c 1a 00 00    	mov    %edx,0x1a9c
    p->s.size += bp->s.size;
    1652:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1655:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1658:	89 0a                	mov    %ecx,(%edx)
}
    165a:	5b                   	pop    %ebx
    165b:	5e                   	pop    %esi
    165c:	5f                   	pop    %edi
    165d:	5d                   	pop    %ebp
    165e:	c3                   	ret    
    165f:	90                   	nop

00001660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    166c:	8b 3d 9c 1a 00 00    	mov    0x1a9c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1672:	8d 70 07             	lea    0x7(%eax),%esi
    1675:	c1 ee 03             	shr    $0x3,%esi
    1678:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    167b:	85 ff                	test   %edi,%edi
    167d:	0f 84 9d 00 00 00    	je     1720 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1683:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1685:	8b 4a 04             	mov    0x4(%edx),%ecx
    1688:	39 f1                	cmp    %esi,%ecx
    168a:	73 6a                	jae    16f6 <malloc+0x96>
    168c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1691:	39 de                	cmp    %ebx,%esi
    1693:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1696:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    169d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16a0:	eb 17                	jmp    16b9 <malloc+0x59>
    16a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16aa:	8b 48 04             	mov    0x4(%eax),%ecx
    16ad:	39 f1                	cmp    %esi,%ecx
    16af:	73 4f                	jae    1700 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16b1:	8b 3d 9c 1a 00 00    	mov    0x1a9c,%edi
    16b7:	89 c2                	mov    %eax,%edx
    16b9:	39 d7                	cmp    %edx,%edi
    16bb:	75 eb                	jne    16a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    16bd:	83 ec 0c             	sub    $0xc,%esp
    16c0:	ff 75 e4             	pushl  -0x1c(%ebp)
    16c3:	e8 93 fc ff ff       	call   135b <sbrk>
  if(p == (char*)-1)
    16c8:	83 c4 10             	add    $0x10,%esp
    16cb:	83 f8 ff             	cmp    $0xffffffff,%eax
    16ce:	74 1c                	je     16ec <malloc+0x8c>
  hp->s.size = nu;
    16d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16d3:	83 ec 0c             	sub    $0xc,%esp
    16d6:	83 c0 08             	add    $0x8,%eax
    16d9:	50                   	push   %eax
    16da:	e8 f1 fe ff ff       	call   15d0 <free>
  return freep;
    16df:	8b 15 9c 1a 00 00    	mov    0x1a9c,%edx
      if((p = morecore(nunits)) == 0)
    16e5:	83 c4 10             	add    $0x10,%esp
    16e8:	85 d2                	test   %edx,%edx
    16ea:	75 bc                	jne    16a8 <malloc+0x48>
        return 0;
  }
}
    16ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16ef:	31 c0                	xor    %eax,%eax
}
    16f1:	5b                   	pop    %ebx
    16f2:	5e                   	pop    %esi
    16f3:	5f                   	pop    %edi
    16f4:	5d                   	pop    %ebp
    16f5:	c3                   	ret    
    if(p->s.size >= nunits){
    16f6:	89 d0                	mov    %edx,%eax
    16f8:	89 fa                	mov    %edi,%edx
    16fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1700:	39 ce                	cmp    %ecx,%esi
    1702:	74 4c                	je     1750 <malloc+0xf0>
        p->s.size -= nunits;
    1704:	29 f1                	sub    %esi,%ecx
    1706:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    170c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    170f:	89 15 9c 1a 00 00    	mov    %edx,0x1a9c
}
    1715:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1718:	83 c0 08             	add    $0x8,%eax
}
    171b:	5b                   	pop    %ebx
    171c:	5e                   	pop    %esi
    171d:	5f                   	pop    %edi
    171e:	5d                   	pop    %ebp
    171f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1720:	c7 05 9c 1a 00 00 a0 	movl   $0x1aa0,0x1a9c
    1727:	1a 00 00 
    base.s.size = 0;
    172a:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
    base.s.ptr = freep = prevp = &base;
    172f:	c7 05 a0 1a 00 00 a0 	movl   $0x1aa0,0x1aa0
    1736:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1739:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    173b:	c7 05 a4 1a 00 00 00 	movl   $0x0,0x1aa4
    1742:	00 00 00 
    if(p->s.size >= nunits){
    1745:	e9 42 ff ff ff       	jmp    168c <malloc+0x2c>
    174a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1750:	8b 08                	mov    (%eax),%ecx
    1752:	89 0a                	mov    %ecx,(%edx)
    1754:	eb b9                	jmp    170f <malloc+0xaf>
