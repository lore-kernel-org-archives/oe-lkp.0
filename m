Content-Type: multipart/mixed; boundary="===============4895310395005538128=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] 177672afd93: -40.9% dbench.throughput-MB/sec
Date: Sat, 12 Apr 2014 10:51:54 +0800
Message-ID: <20140412025154.GA9119@localhost>
In-Reply-To: <20140408020850.GC8796@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4895310395005538128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 10:08:50AM +0800, Fengguang Wu wrote:
> Hi Tim,
> =

> Here are the test summary.
> =

> % compare -ia wfg/tim-idle-load-balance
>     98      perf-index  wfg/tim-idle-load-balance
>    124     power-index  wfg/tim-idle-load-balance
>     94   latency-index  wfg/tim-idle-load-balance
> =

>           v3.13  177672afd93461854abe26c05
> ---------------  -------------------------

Sorry that indicates a bug: 177672afd93461854abe26c05 is based on
v3.14. The correct output is:

    99      perf-index  wfg/tim-idle-load-balance
   100     power-index  wfg/tim-idle-load-balance
    93   latency-index  wfg/tim-idle-load-balance

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

   1216126           +1.2%    1230651       brickland1/micro/will-it-scale/=
brk1
     39682           +0.3%      39807       brickland1/micro/will-it-scale/=
context_switch1
   1007817           +5.4%    1062687       brickland1/micro/will-it-scale/=
eventfd1
   2186758          +20.7%    2639202       brickland1/micro/will-it-scale/=
futex1
   1547616          +18.5%    1834210       brickland1/micro/will-it-scale/=
futex2
   4140362           -2.2%    4050250       brickland1/micro/will-it-scale/=
futex3
   3120101           -9.8%    2813236       brickland1/micro/will-it-scale/=
futex4
   6664061           -2.9%    6471503       brickland1/micro/will-it-scale/=
getppid1
    997923           -1.7%     981036       brickland1/micro/will-it-scale/=
lock1
   5891274          -11.8%    5194097       brickland1/micro/will-it-scale/=
lseek1
   5577575           -7.4%    5163396       brickland1/micro/will-it-scale/=
lseek2
     21523           +1.4%      21825       brickland1/micro/will-it-scale/=
malloc1
   6199466           +0.7%    6245480       brickland1/micro/will-it-scale/=
malloc2
     49860           -1.6%      49063       brickland1/micro/will-it-scale/=
mmap1
     48379           -1.7%      47534       brickland1/micro/will-it-scale/=
mmap2
    250439           -1.3%     247106       brickland1/micro/will-it-scale/=
open1
    256575          -11.6%     226851       brickland1/micro/will-it-scale/=
open2
    304154           -0.6%     302207       brickland1/micro/will-it-scale/=
page_fault1
    103741           -2.3%     101373       brickland1/micro/will-it-scale/=
page_fault2
    406143          +30.4%     529501       brickland1/micro/will-it-scale/=
page_fault3
    555796          +20.8%     671491       brickland1/micro/will-it-scale/=
pipe1
   4034418          -13.1%    3507270       brickland1/micro/will-it-scale/=
poll1
    231467           +1.4%     234731       brickland1/micro/will-it-scale/=
poll2
  12911410           +2.0%   13169386       brickland1/micro/will-it-scale/=
posix_semaphore1
   1111283           -5.6%    1049052       brickland1/micro/will-it-scale/=
pread1
    175474           -5.6%     165656       brickland1/micro/will-it-scale/=
pread2
  63452045           +1.3%   64293617       brickland1/micro/will-it-scale/=
pthread_mutex1
  68820415           +1.5%   69870861       brickland1/micro/will-it-scale/=
pthread_mutex2
    650077           +9.8%     713838       brickland1/micro/will-it-scale/=
pwrite1
    114226           -2.6%     111223       brickland1/micro/will-it-scale/=
pwrite2
    724921           -1.6%     713429       brickland1/micro/will-it-scale/=
read1
    412672           +0.4%     414423       brickland1/micro/will-it-scale/=
read2
    828439          +12.3%     930556       brickland1/micro/will-it-scale/=
readseek
   1392799          +20.1%    1672822       brickland1/micro/will-it-scale/=
sched_yield
    107234           +4.2%     111700       brickland1/micro/will-it-scale/=
signal1
    487612          -15.9%     410179       brickland1/micro/will-it-scale/=
unix1
     15168           +3.4%      15685       brickland1/micro/will-it-scale/=
unlink1
     19270           -1.7%      18947       brickland1/micro/will-it-scale/=
unlink2
    523134           -1.4%     515967       brickland1/micro/will-it-scale/=
write1
    603677           -4.7%     575262       brickland1/micro/will-it-scale/=
writeseek
   3394819          +18.9%    4037172       kbuildx/micro/will-it-scale/brk1
    397380           +5.7%     420172       kbuildx/micro/will-it-scale/con=
text_switch1
   3579513          -18.7%    2911814       kbuildx/micro/will-it-scale/eve=
ntfd1
   5386290          -13.5%    4658574       kbuildx/micro/will-it-scale/fut=
ex1
   4841668          -16.8%    4029473       kbuildx/micro/will-it-scale/fut=
ex2
  12975211           +0.7%   13060407       kbuildx/micro/will-it-scale/fut=
ex3
   8858896          -11.5%    7841336       kbuildx/micro/will-it-scale/fut=
ex4
  19291765           +0.7%   19424336       kbuildx/micro/will-it-scale/get=
ppid1
   3284672           -1.3%    3241283       kbuildx/micro/will-it-scale/loc=
k1
  17239503           -1.9%   16917603       kbuildx/micro/will-it-scale/lse=
ek1
  17452712          -14.4%   14940232       kbuildx/micro/will-it-scale/lse=
ek2
    172226           +7.2%     184579       kbuildx/micro/will-it-scale/mal=
loc1
  27992120           -1.3%   27615173       kbuildx/micro/will-it-scale/mal=
loc2
    756253           -0.2%     755057       kbuildx/micro/will-it-scale/mma=
p1
    317096         +116.8%     687408       kbuildx/micro/will-it-scale/mma=
p2
    531345          +50.7%     800981       kbuildx/micro/will-it-scale/ope=
n1
    483688           -3.4%     467132       kbuildx/micro/will-it-scale/ope=
n2
   1400452          -15.1%    1189039       kbuildx/micro/will-it-scale/pag=
e_fault1
    347407           +6.7%     370642       kbuildx/micro/will-it-scale/pag=
e_fault2
   1144938          -10.8%    1021800       kbuildx/micro/will-it-scale/pag=
e_fault3
   1911155           -0.2%    1907225       kbuildx/micro/will-it-scale/pip=
e1
  10049046          +18.5%   11907480       kbuildx/micro/will-it-scale/pol=
l1
    559897           +1.3%     567346       kbuildx/micro/will-it-scale/pol=
l2
  41637285           -5.3%   39430596       kbuildx/micro/will-it-scale/pos=
ix_semaphore1
   1536128           +2.2%    1570040       kbuildx/micro/will-it-scale/pre=
ad1
   1264741          -31.0%     872712       kbuildx/micro/will-it-scale/pre=
ad2
  2.12e+08           -8.1%  1.949e+08       kbuildx/micro/will-it-scale/pth=
read_mutex1
 2.278e+08           -0.9%  2.258e+08       kbuildx/micro/will-it-scale/pth=
read_mutex2
   1872033          -17.7%    1540361       kbuildx/micro/will-it-scale/pwr=
ite1
    684977          +25.1%     856735       kbuildx/micro/will-it-scale/pwr=
ite2
   1633083           +8.1%    1764808       kbuildx/micro/will-it-scale/rea=
d1
   1450884          +20.1%    1742796       kbuildx/micro/will-it-scale/rea=
d2
   2177687           +5.1%    2288540       kbuildx/micro/will-it-scale/rea=
dseek
   4062395           -1.3%    4011241       kbuildx/micro/will-it-scale/sch=
ed_yield
    923474           +4.8%     967611       kbuildx/micro/will-it-scale/sig=
nal1
    921097          -30.7%     638204       kbuildx/micro/will-it-scale/uni=
x1
     72007          -35.6%      46401       kbuildx/micro/will-it-scale/unl=
ink1
    108782          +10.2%     119824       kbuildx/micro/will-it-scale/unl=
ink2
   1075777          +13.1%    1216816       kbuildx/micro/will-it-scale/wri=
te1
   1590850          -41.7%     927781       kbuildx/micro/will-it-scale/wri=
teseek
    517056           -2.1%     506398       lkp-a03/micro/will-it-scale/brk1
     59283           +0.8%      59758       lkp-a03/micro/will-it-scale/con=
text_switch1
    526676           +1.2%     532971       lkp-a03/micro/will-it-scale/eve=
ntfd1
   1292541           +2.3%    1322807       lkp-a03/micro/will-it-scale/fut=
ex1
    959653           +8.5%    1041086       lkp-a03/micro/will-it-scale/fut=
ex2
   2707753           +0.4%    2719162       lkp-a03/micro/will-it-scale/fut=
ex3
   1996578           -0.7%    1982080       lkp-a03/micro/will-it-scale/fut=
ex4
   4694345           +0.1%    4701250       lkp-a03/micro/will-it-scale/get=
ppid1
    432787           -4.5%     413147       lkp-a03/micro/will-it-scale/loc=
k1
   3428242           -6.1%    3220162       lkp-a03/micro/will-it-scale/lse=
ek1
   3404795           -2.4%    3323511       lkp-a03/micro/will-it-scale/lse=
ek2
     35208           +1.0%      35556       lkp-a03/micro/will-it-scale/mal=
loc1
   4017730           -0.0%    4016965       lkp-a03/micro/will-it-scale/mal=
loc2
    115922           +3.1%     119459       lkp-a03/micro/will-it-scale/mma=
p1
    101412           -0.2%     101178       lkp-a03/micro/will-it-scale/mma=
p2
    110932           -0.4%     110490       lkp-a03/micro/will-it-scale/ope=
n1
    107967           -4.8%     102749       lkp-a03/micro/will-it-scale/ope=
n2
    176042           +0.2%     176416       lkp-a03/micro/will-it-scale/pag=
e_fault1
     79542           -0.5%      79155       lkp-a03/micro/will-it-scale/pag=
e_fault2
    335584           +0.2%     336252       lkp-a03/micro/will-it-scale/pag=
e_fault3
    287652           +1.1%     290822       lkp-a03/micro/will-it-scale/pip=
e1
   1967528           -4.0%    1889571       lkp-a03/micro/will-it-scale/pol=
l1
     90288           +0.5%      90743       lkp-a03/micro/will-it-scale/pol=
l2
  12870721           -0.6%   12796431       lkp-a03/micro/will-it-scale/pos=
ix_semaphore1
    447193           -3.7%     430800       lkp-a03/micro/will-it-scale/pre=
ad1
    377299           -1.3%     372426       lkp-a03/micro/will-it-scale/pre=
ad2
  19173243           +0.0%   19175900       lkp-a03/micro/will-it-scale/pth=
read_mutex1
  19874395           -0.0%   19869328       lkp-a03/micro/will-it-scale/pth=
read_mutex2
    317886           +1.8%     323607       lkp-a03/micro/will-it-scale/pwr=
ite1
    158160           +6.4%     168264       lkp-a03/micro/will-it-scale/pwr=
ite2
    206846           +2.8%     212548       lkp-a03/micro/will-it-scale/rea=
d1
    175882          +11.8%     196697       lkp-a03/micro/will-it-scale/rea=
d2
    393526           -3.8%     378486       lkp-a03/micro/will-it-scale/rea=
dseek
    800774           +1.0%     808771       lkp-a03/micro/will-it-scale/sch=
ed_yield
    195567           +1.8%     199112       lkp-a03/micro/will-it-scale/sig=
nal1
    173134           +2.9%     178212       lkp-a03/micro/will-it-scale/uni=
x1
     25784           -0.6%      25633       lkp-a03/micro/will-it-scale/unl=
ink1
     29360           -1.2%      29014       lkp-a03/micro/will-it-scale/unl=
ink2
    149458           -1.4%     147353       lkp-a03/micro/will-it-scale/wri=
te1
    279568           -0.1%     279218       lkp-a03/micro/will-it-scale/wri=
teseek
   2514868           +2.3%    2572479       lkp-nex05/micro/will-it-scale/b=
rk1
    202858           -6.0%     190761       lkp-nex05/micro/will-it-scale/c=
ontext_switch1
   2038881           -1.1%    2016269       lkp-nex05/micro/will-it-scale/e=
ventfd1
   3840976           +0.2%    3849899       lkp-nex05/micro/will-it-scale/f=
utex1
   3128420           -4.3%    2993351       lkp-nex05/micro/will-it-scale/f=
utex2
   7600425           -0.2%    7582465       lkp-nex05/micro/will-it-scale/f=
utex3
   5422876           -7.2%    5030654       lkp-nex05/micro/will-it-scale/f=
utex4
  13229606           +0.2%   13253248       lkp-nex05/micro/will-it-scale/g=
etppid1
   1663882           +0.3%    1668624       lkp-nex05/micro/will-it-scale/l=
ock1
  11333333           -4.0%   10884900       lkp-nex05/micro/will-it-scale/l=
seek1
  11310856           -4.1%   10841759       lkp-nex05/micro/will-it-scale/l=
seek2
     45760           +2.0%      46689       lkp-nex05/micro/will-it-scale/m=
alloc1
  15014899           +0.1%   15027326       lkp-nex05/micro/will-it-scale/m=
alloc2
    111282           +1.0%     112357       lkp-nex05/micro/will-it-scale/m=
map1
    100604           +2.1%     102678       lkp-nex05/micro/will-it-scale/m=
map2
    430405           +0.8%     433884       lkp-nex05/micro/will-it-scale/o=
pen1
    423489           -1.6%     416547       lkp-nex05/micro/will-it-scale/o=
pen2
    210503           -0.2%     210125       lkp-nex05/micro/will-it-scale/p=
age_fault1
    101252           +0.9%     102179       lkp-nex05/micro/will-it-scale/p=
age_fault2
    673825           +0.0%     674037       lkp-nex05/micro/will-it-scale/p=
age_fault3
   1224214           -0.8%    1214791       lkp-nex05/micro/will-it-scale/p=
ipe1
   5052384           -0.0%    5051768       lkp-nex05/micro/will-it-scale/p=
oll1
    365692           -0.1%     365301       lkp-nex05/micro/will-it-scale/p=
oll2
  30138616           -0.8%   29887558       lkp-nex05/micro/will-it-scale/p=
osix_semaphore1
   1997225           -0.2%    1993847       lkp-nex05/micro/will-it-scale/p=
read1
    437626           -0.1%     437196       lkp-nex05/micro/will-it-scale/p=
read2
  1.24e+08           -0.0%   1.24e+08       lkp-nex05/micro/will-it-scale/p=
thread_mutex1
 1.319e+08           -0.1%  1.318e+08       lkp-nex05/micro/will-it-scale/p=
thread_mutex2
   1420572           -0.6%    1411572       lkp-nex05/micro/will-it-scale/p=
write1
    304504           +1.5%     309159       lkp-nex05/micro/will-it-scale/p=
write2
   1320922           -0.7%    1311784       lkp-nex05/micro/will-it-scale/r=
ead1
   1008716           -3.1%     977501       lkp-nex05/micro/will-it-scale/r=
ead2
   1701818           -1.2%    1680686       lkp-nex05/micro/will-it-scale/r=
eadseek
   2843492           -3.4%    2746583       lkp-nex05/micro/will-it-scale/s=
ched_yield
    186730           -0.9%     185037       lkp-nex05/micro/will-it-scale/s=
ignal1
    759500           +7.3%     814811       lkp-nex05/micro/will-it-scale/u=
nix1
     36401           -3.9%      34975       lkp-nex05/micro/will-it-scale/u=
nlink1
     43953           -3.2%      42534       lkp-nex05/micro/will-it-scale/u=
nlink2
   1061138           -0.1%    1059758       lkp-nex05/micro/will-it-scale/w=
rite1
   1261502           -1.0%    1249463       lkp-nex05/micro/will-it-scale/w=
riteseek
   3502479           +0.2%    3509778       lkp-sbx04/micro/will-it-scale/b=
rk1
    348811           -5.3%     330432       lkp-sbx04/micro/will-it-scale/c=
ontext_switch1
   2920341           -3.1%    2828761       lkp-sbx04/micro/will-it-scale/e=
ventfd1
   5208382           +0.5%    5233531       lkp-sbx04/micro/will-it-scale/f=
utex1
   4269571           -6.7%    3985540       lkp-sbx04/micro/will-it-scale/f=
utex2
  11065581           +1.2%   11195723       lkp-sbx04/micro/will-it-scale/f=
utex3
   7527544           -9.1%    6840745       lkp-sbx04/micro/will-it-scale/f=
utex4
  19008062           +1.4%   19275283       lkp-sbx04/micro/will-it-scale/g=
etppid1
   2466989           -0.5%    2454676       lkp-sbx04/micro/will-it-scale/l=
ock1
  15453452           -2.3%   15103063       lkp-sbx04/micro/will-it-scale/l=
seek1
  15693743           -4.1%   15043736       lkp-sbx04/micro/will-it-scale/l=
seek2
     85663           -3.2%      82934       lkp-sbx04/micro/will-it-scale/m=
alloc1
  23420421           +0.7%   23572891       lkp-sbx04/micro/will-it-scale/m=
alloc2
    215916           -1.1%     213553       lkp-sbx04/micro/will-it-scale/m=
map1
    204823           -7.1%     190265       lkp-sbx04/micro/will-it-scale/m=
map2
    616775           +0.5%     619792       lkp-sbx04/micro/will-it-scale/o=
pen1
    593398           -2.5%     578615       lkp-sbx04/micro/will-it-scale/o=
pen2
    258779           +0.4%     259898       lkp-sbx04/micro/will-it-scale/p=
age_fault1
    125014           -0.1%     124868       lkp-sbx04/micro/will-it-scale/p=
age_fault2
   1227666           +2.8%    1261848       lkp-sbx04/micro/will-it-scale/p=
age_fault3
   1620845           -0.2%    1618346       lkp-sbx04/micro/will-it-scale/p=
ipe1
   7595912           -0.9%    7526641       lkp-sbx04/micro/will-it-scale/p=
oll1
    607010           -0.2%     605803       lkp-sbx04/micro/will-it-scale/p=
oll2
  35178663           -0.6%   34970336       lkp-sbx04/micro/will-it-scale/p=
osix_semaphore1
   2767153           -0.3%    2759797       lkp-sbx04/micro/will-it-scale/p=
read1
    506564           +0.5%     509213       lkp-sbx04/micro/will-it-scale/p=
read2
 1.874e+08           -0.1%  1.872e+08       lkp-sbx04/micro/will-it-scale/p=
thread_mutex1
 1.982e+08           -0.5%  1.971e+08       lkp-sbx04/micro/will-it-scale/p=
thread_mutex2
   1839958           -0.2%    1836365       lkp-sbx04/micro/will-it-scale/p=
write1
    350617           -0.4%     349159       lkp-sbx04/micro/will-it-scale/p=
write2
   2113861           +0.0%    2114336       lkp-sbx04/micro/will-it-scale/r=
ead1
   1148698           +2.4%    1176767       lkp-sbx04/micro/will-it-scale/r=
ead2
   2344574           -0.0%    2344208       lkp-sbx04/micro/will-it-scale/r=
eadseek
   4099951           -1.0%    4058047       lkp-sbx04/micro/will-it-scale/s=
ched_yield
    335422           -0.5%     333604       lkp-sbx04/micro/will-it-scale/s=
ignal1
   1200148           -3.9%    1153643       lkp-sbx04/micro/will-it-scale/u=
nix1
     51263           -0.2%      51152       lkp-sbx04/micro/will-it-scale/u=
nlink1
     70483           +0.5%      70822       lkp-sbx04/micro/will-it-scale/u=
nlink2
   1510764           -0.2%    1507972       lkp-sbx04/micro/will-it-scale/w=
rite1
   1644674           -1.0%    1627852       lkp-sbx04/micro/will-it-scale/w=
riteseek
   2825677           +2.1%    2884034       lkp-wsx01/micro/will-it-scale/b=
rk1
    176455           -2.9%     171285       lkp-wsx01/micro/will-it-scale/c=
ontext_switch1
   2402769           -3.6%    2317020       lkp-wsx01/micro/will-it-scale/e=
ventfd1
   4484014           +2.8%    4607915       lkp-wsx01/micro/will-it-scale/f=
utex1
   3709474           -4.1%    3555600       lkp-wsx01/micro/will-it-scale/f=
utex2
   9009474           -0.5%    8967780       lkp-wsx01/micro/will-it-scale/f=
utex3
   6420006           -7.4%    5942902       lkp-wsx01/micro/will-it-scale/f=
utex4
  15526480           +0.2%   15558856       lkp-wsx01/micro/will-it-scale/g=
etppid1
   1863201           -0.5%    1853505       lkp-wsx01/micro/will-it-scale/l=
ock1
  13488495           -5.2%   12793809       lkp-wsx01/micro/will-it-scale/l=
seek1
  13440308           -4.5%   12831644       lkp-wsx01/micro/will-it-scale/l=
seek2
     64598           -0.6%      64204       lkp-wsx01/micro/will-it-scale/m=
alloc1
  18307366           +0.0%   18309804       lkp-wsx01/micro/will-it-scale/m=
alloc2
    128490           +0.8%     129508       lkp-wsx01/micro/will-it-scale/m=
map1
    118771           +1.5%     120502       lkp-wsx01/micro/will-it-scale/m=
map2
    525631           -0.2%     524840       lkp-wsx01/micro/will-it-scale/o=
pen1
    493124           +1.6%     501130       lkp-wsx01/micro/will-it-scale/o=
pen2
    339405           +0.4%     340767       lkp-wsx01/micro/will-it-scale/p=
age_fault1
    144140           +0.6%     145025       lkp-wsx01/micro/will-it-scale/p=
age_fault2
    969759           +0.5%     974733       lkp-wsx01/micro/will-it-scale/p=
age_fault3
   1424167           -1.4%    1404284       lkp-wsx01/micro/will-it-scale/p=
ipe1
   6018537           +0.8%    6064176       lkp-wsx01/micro/will-it-scale/p=
oll1
    431758           +1.2%     436792       lkp-wsx01/micro/will-it-scale/p=
oll2
  38681031           +0.2%   38739193       lkp-wsx01/micro/will-it-scale/p=
osix_semaphore1
   2253475           -0.5%    2241170       lkp-wsx01/micro/will-it-scale/p=
read1
    400529           -4.7%     381651       lkp-wsx01/micro/will-it-scale/p=
read2
 1.505e+08           +0.0%  1.505e+08       lkp-wsx01/micro/will-it-scale/p=
thread_mutex1
 1.607e+08           +0.0%  1.607e+08       lkp-wsx01/micro/will-it-scale/p=
thread_mutex2
   1576287           +0.6%    1586482       lkp-wsx01/micro/will-it-scale/p=
write1
    282281           -1.3%     278641       lkp-wsx01/micro/will-it-scale/p=
write2
   1613654           -0.9%    1598542       lkp-wsx01/micro/will-it-scale/r=
ead1
   1065746           -2.5%    1039017       lkp-wsx01/micro/will-it-scale/r=
ead2
   1916104           -0.7%    1901846       lkp-wsx01/micro/will-it-scale/r=
eadseek
   3346568           -2.1%    3275658       lkp-wsx01/micro/will-it-scale/s=
ched_yield
    259703           -1.8%     255112       lkp-wsx01/micro/will-it-scale/s=
ignal1
    883634           +7.4%     948725       lkp-wsx01/micro/will-it-scale/u=
nix1
     35950           -4.3%      34419       lkp-wsx01/micro/will-it-scale/u=
nlink1
     53368           -0.7%      52991       lkp-wsx01/micro/will-it-scale/u=
nlink2
   1349051           -0.8%    1338439       lkp-wsx01/micro/will-it-scale/w=
rite1
   1404781           -0.2%    1401526       lkp-wsx01/micro/will-it-scale/w=
riteseek
   3477272           +2.0%    3546780       nhm4/micro/will-it-scale/brk1
    337345           -2.9%     327679       nhm4/micro/will-it-scale/contex=
t_switch1
   2886872           -1.2%    2852431       nhm4/micro/will-it-scale/eventf=
d1
   5654287           +0.8%    5699517       nhm4/micro/will-it-scale/futex1
   4632835           -5.7%    4366750       nhm4/micro/will-it-scale/futex2
  11095725           +1.1%   11216838       nhm4/micro/will-it-scale/futex3
   7846971           -7.1%    7292231       nhm4/micro/will-it-scale/futex4
  16901432           +2.0%   17235083       nhm4/micro/will-it-scale/getppi=
d1
   2354078           +0.1%    2355776       nhm4/micro/will-it-scale/lock1
  16052142           -3.1%   15554700       nhm4/micro/will-it-scale/lseek1
  15749043           -1.5%   15515366       nhm4/micro/will-it-scale/lseek2
    226634           -1.0%     224399       nhm4/micro/will-it-scale/malloc1
  21942925           -0.0%   21939977       nhm4/micro/will-it-scale/malloc2
    640939           +1.5%     650406       nhm4/micro/will-it-scale/mmap1
    571491           +1.0%     577295       nhm4/micro/will-it-scale/mmap2
    727377           -1.0%     720130       nhm4/micro/will-it-scale/open1
    688219           -1.5%     677671       nhm4/micro/will-it-scale/open2
    887765           -0.1%     886903       nhm4/micro/will-it-scale/page_f=
ault1
    333719           +0.1%     334175       nhm4/micro/will-it-scale/page_f=
ault2
   1511861           +1.2%    1530271       nhm4/micro/will-it-scale/page_f=
ault3
   1725196           -0.7%    1713421       nhm4/micro/will-it-scale/pipe1
   7413386           -1.0%    7342031       nhm4/micro/will-it-scale/poll1
    531382           -0.5%     528533       nhm4/micro/will-it-scale/poll2
  48681545           -0.0%   48666306       nhm4/micro/will-it-scale/posix_=
semaphore1
   2859753           -0.1%    2855550       nhm4/micro/will-it-scale/pread1
   1202736           +0.6%    1210131       nhm4/micro/will-it-scale/pread2
 1.824e+08           +0.0%  1.824e+08       nhm4/micro/will-it-scale/pthrea=
d_mutex1
 1.963e+08           -0.0%  1.963e+08       nhm4/micro/will-it-scale/pthrea=
d_mutex2
   2015762           +0.6%    2026934       nhm4/micro/will-it-scale/pwrite1
    798843           -0.7%     793102       nhm4/micro/will-it-scale/pwrite2
   1970155           -1.4%    1943511       nhm4/micro/will-it-scale/read1
   2107600           -0.7%    2092552       nhm4/micro/will-it-scale/read2
   2388004           +0.1%    2390702       nhm4/micro/will-it-scale/readse=
ek
   4140931           -2.2%    4047801       nhm4/micro/will-it-scale/sched_=
yield
    941479           -4.2%     901998       nhm4/micro/will-it-scale/signal1
   1105107           +5.8%    1169529       nhm4/micro/will-it-scale/unix1
    121525           -1.7%     119411       nhm4/micro/will-it-scale/unlink1
    190247           +0.4%     190955       nhm4/micro/will-it-scale/unlink2
   1287281           +1.9%    1312270       nhm4/micro/will-it-scale/write1
   1801855           -0.6%    1791528       nhm4/micro/will-it-scale/writes=
eek
 2.918e+09           -1.1%  2.885e+09       TOTAL will-it-scale.per_process=
_ops

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

    158952           +3.1%     163926       brickland1/micro/will-it-scale/=
brk1
     39919           +1.2%      40391       brickland1/micro/will-it-scale/=
context_switch1
    848784           +2.3%     868089       brickland1/micro/will-it-scale/=
eventfd1
    363460           +9.3%     397116       brickland1/micro/will-it-scale/=
futex1
    309642           -7.5%     286271       brickland1/micro/will-it-scale/=
futex2
   4147695           -1.7%    4075935       brickland1/micro/will-it-scale/=
futex3
   2787169           -9.4%    2526085       brickland1/micro/will-it-scale/=
futex4
   6716580           -4.7%    6400544       brickland1/micro/will-it-scale/=
getppid1
    161455           -1.8%     158476       brickland1/micro/will-it-scale/=
lock1
   2888245           -3.6%    2783064       brickland1/micro/will-it-scale/=
lseek1
   2805388           -2.7%    2728974       brickland1/micro/will-it-scale/=
lseek2
     14474           +0.1%      14495       brickland1/micro/will-it-scale/=
malloc1
   5691258           -0.7%    5649539       brickland1/micro/will-it-scale/=
malloc2
     43136           +0.0%      43145       brickland1/micro/will-it-scale/=
mmap1
     40127           +2.0%      40916       brickland1/micro/will-it-scale/=
mmap2
     50326           -6.5%      47037       brickland1/micro/will-it-scale/=
open1
     69553          -32.8%      46755       brickland1/micro/will-it-scale/=
open2
    195167           +0.2%     195647       brickland1/micro/will-it-scale/=
page_fault1
     42013           -0.1%      41968       brickland1/micro/will-it-scale/=
page_fault2
    109386           +5.1%     114925       brickland1/micro/will-it-scale/=
page_fault3
    508490           +1.2%     514498       brickland1/micro/will-it-scale/=
pipe1
   2585435           -0.3%    2576863       brickland1/micro/will-it-scale/=
poll1
     91320           -2.8%      88739       brickland1/micro/will-it-scale/=
poll2
  13353347           +1.3%   13525495       brickland1/micro/will-it-scale/=
posix_semaphore1
    953976           -1.1%     943875       brickland1/micro/will-it-scale/=
pread1
    155915           +0.3%     156393       brickland1/micro/will-it-scale/=
pread2
   2191656           +0.3%    2198934       brickland1/micro/will-it-scale/=
pthread_mutex1
  12105866           +0.9%   12211729       brickland1/micro/will-it-scale/=
pthread_mutex2
    608953           +4.8%     638311       brickland1/micro/will-it-scale/=
pwrite1
    105852           -1.3%     104489       brickland1/micro/will-it-scale/=
pwrite2
    634709           -1.6%     624483       brickland1/micro/will-it-scale/=
read1
    391089           -0.4%     389543       brickland1/micro/will-it-scale/=
read2
    636226           +1.1%     642916       brickland1/micro/will-it-scale/=
readseek
   1399847           +3.6%    1450015       brickland1/micro/will-it-scale/=
sched_yield
     59740           +1.5%      60658       brickland1/micro/will-it-scale/=
signal1
    396810           -5.2%     376319       brickland1/micro/will-it-scale/=
unix1
     15234           +5.0%      15999       brickland1/micro/will-it-scale/=
unlink1
     17825           +6.7%      19012       brickland1/micro/will-it-scale/=
unlink2
    474835           -0.2%     473721       brickland1/micro/will-it-scale/=
write1
    505991           -4.8%     481645       brickland1/micro/will-it-scale/=
writeseek
   1117349           +7.1%    1196716       kbuildx/micro/will-it-scale/brk1
    499135           -4.9%     474896       kbuildx/micro/will-it-scale/con=
text_switch1
   2828466          -20.5%    2249953       kbuildx/micro/will-it-scale/eve=
ntfd1
   4261079           -5.9%    4010569       kbuildx/micro/will-it-scale/fut=
ex1
   3743865          -19.8%    3001278       kbuildx/micro/will-it-scale/fut=
ex2
  12992863           +0.4%   13050354       kbuildx/micro/will-it-scale/fut=
ex3
   8820643           -9.5%    7986162       kbuildx/micro/will-it-scale/fut=
ex4
  19649180           -0.8%   19482740       kbuildx/micro/will-it-scale/get=
ppid1
   2378540           -2.3%    2324504       kbuildx/micro/will-it-scale/loc=
k1
   8914948           -0.7%    8853616       kbuildx/micro/will-it-scale/lse=
ek1
   8827285           -2.2%    8630257       kbuildx/micro/will-it-scale/lse=
ek2
     69590           +9.3%      76051       kbuildx/micro/will-it-scale/mal=
loc1
  19071654           -0.1%   19059934       kbuildx/micro/will-it-scale/mal=
loc2
    295519           +6.5%     314825       kbuildx/micro/will-it-scale/mma=
p1
    137621         +101.2%     276911       kbuildx/micro/will-it-scale/mma=
p2
    499247          +33.4%     666086       kbuildx/micro/will-it-scale/ope=
n1
    459645           -1.5%     452597       kbuildx/micro/will-it-scale/ope=
n2
   1251841          -14.3%    1072202       kbuildx/micro/will-it-scale/pag=
e_fault1
    285948           +5.1%     300623       kbuildx/micro/will-it-scale/pag=
e_fault2
    814256          +13.1%     921059       kbuildx/micro/will-it-scale/pag=
e_fault3
   1652411           -3.8%    1589896       kbuildx/micro/will-it-scale/pip=
e1
   6742967          +25.5%    8462421       kbuildx/micro/will-it-scale/pol=
l1
    256133           -4.5%     244608       kbuildx/micro/will-it-scale/pol=
l2
  41984845           -2.6%   40900774       kbuildx/micro/will-it-scale/pos=
ix_semaphore1
   1365689           +0.6%    1373995       kbuildx/micro/will-it-scale/pre=
ad1
   1265291          -25.4%     943591       kbuildx/micro/will-it-scale/pre=
ad2
  16407991          -13.4%   14211477       kbuildx/micro/will-it-scale/pth=
read_mutex1
  39158184           -0.6%   38920694       kbuildx/micro/will-it-scale/pth=
read_mutex2
   1775755          -15.3%    1503479       kbuildx/micro/will-it-scale/pwr=
ite1
    687613          +19.1%     819155       kbuildx/micro/will-it-scale/pwr=
ite2
   1443071           +1.4%    1463384       kbuildx/micro/will-it-scale/rea=
d1
   1424268           -6.5%    1331083       kbuildx/micro/will-it-scale/rea=
d2
   1673421          +10.5%    1849544       kbuildx/micro/will-it-scale/rea=
dseek
   3943634           +2.0%    4023058       kbuildx/micro/will-it-scale/sch=
ed_yield
    597676          +11.7%     667522       kbuildx/micro/will-it-scale/sig=
nal1
    746794          -33.8%     494097       kbuildx/micro/will-it-scale/uni=
x1
     76051          -38.8%      46573       kbuildx/micro/will-it-scale/unl=
ink1
     99638          +41.5%     140956       kbuildx/micro/will-it-scale/unl=
ink2
    928812          +12.0%    1040055       kbuildx/micro/will-it-scale/wri=
te1
   1328199          -39.8%     799273       kbuildx/micro/will-it-scale/wri=
teseek
    139699          +14.6%     160072       lkp-a03/micro/will-it-scale/brk1
     64229           -1.2%      63460       lkp-a03/micro/will-it-scale/con=
text_switch1
    501650           +3.1%     517442       lkp-a03/micro/will-it-scale/eve=
ntfd1
   1084211           -1.4%    1068744       lkp-a03/micro/will-it-scale/fut=
ex1
    840881           +9.5%     921073       lkp-a03/micro/will-it-scale/fut=
ex2
   2740108           -0.7%    2721713       lkp-a03/micro/will-it-scale/fut=
ex3
   2022728           -2.1%    1980391       lkp-a03/micro/will-it-scale/fut=
ex4
   4694982           +0.1%    4700300       lkp-a03/micro/will-it-scale/get=
ppid1
    386842           -5.4%     365931       lkp-a03/micro/will-it-scale/loc=
k1
   2360330           -5.5%    2230663       lkp-a03/micro/will-it-scale/lse=
ek1
   2358009           -5.2%    2235883       lkp-a03/micro/will-it-scale/lse=
ek2
     11541           -1.4%      11385       lkp-a03/micro/will-it-scale/mal=
loc1
   3719716           +0.2%    3728026       lkp-a03/micro/will-it-scale/mal=
loc2
     54129           -0.4%      53937       lkp-a03/micro/will-it-scale/mma=
p1
     47307           -0.3%      47156       lkp-a03/micro/will-it-scale/mma=
p2
    106310           -0.6%     105677       lkp-a03/micro/will-it-scale/ope=
n1
    103357           -4.9%      98252       lkp-a03/micro/will-it-scale/ope=
n2
    172501           +0.3%     173029       lkp-a03/micro/will-it-scale/pag=
e_fault1
     69530           +0.2%      69658       lkp-a03/micro/will-it-scale/pag=
e_fault2
    279737           +2.3%     286097       lkp-a03/micro/will-it-scale/pag=
e_fault3
    276747           +2.6%     283850       lkp-a03/micro/will-it-scale/pip=
e1
   1645663           -1.3%    1624062       lkp-a03/micro/will-it-scale/pol=
l1
     59636           -0.2%      59513       lkp-a03/micro/will-it-scale/pol=
l2
  12934317           +0.0%   12939294       lkp-a03/micro/will-it-scale/pos=
ix_semaphore1
    429639           -1.7%     422342       lkp-a03/micro/will-it-scale/pre=
ad1
    348056           +1.7%     353918       lkp-a03/micro/will-it-scale/pre=
ad2
   4149031           +3.1%    4275753       lkp-a03/micro/will-it-scale/pth=
read_mutex1
  11884149           +0.0%   11888242       lkp-a03/micro/will-it-scale/pth=
read_mutex2
    317096           -2.3%     309658       lkp-a03/micro/will-it-scale/pwr=
ite1
    151929           -0.1%     151813       lkp-a03/micro/will-it-scale/pwr=
ite2
    189782           -0.4%     189029       lkp-a03/micro/will-it-scale/rea=
d1
    202770           -2.7%     197232       lkp-a03/micro/will-it-scale/rea=
d2
    347056           -1.7%     341108       lkp-a03/micro/will-it-scale/rea=
dseek
    818581           +0.0%     818662       lkp-a03/micro/will-it-scale/sch=
ed_yield
    145483           +3.3%     150355       lkp-a03/micro/will-it-scale/sig=
nal1
    165919           +2.9%     170649       lkp-a03/micro/will-it-scale/uni=
x1
     25612           -0.7%      25420       lkp-a03/micro/will-it-scale/unl=
ink1
     29317           -2.2%      28667       lkp-a03/micro/will-it-scale/unl=
ink2
    145140           +0.3%     145591       lkp-a03/micro/will-it-scale/wri=
te1
    263961           -3.6%     254503       lkp-a03/micro/will-it-scale/wri=
teseek
    372805           +7.9%     402101       lkp-nex05/micro/will-it-scale/b=
rk1
    175212           -3.5%     169110       lkp-nex05/micro/will-it-scale/c=
ontext_switch1
   1725000           -1.5%    1698632       lkp-nex05/micro/will-it-scale/e=
ventfd1
    876920           +1.1%     886616       lkp-nex05/micro/will-it-scale/f=
utex1
    714131           -5.7%     673642       lkp-nex05/micro/will-it-scale/f=
utex2
   7584605           +0.2%    7599232       lkp-nex05/micro/will-it-scale/f=
utex3
   5431112           -8.0%    4998767       lkp-nex05/micro/will-it-scale/f=
utex4
  13184428           +1.1%   13326214       lkp-nex05/micro/will-it-scale/g=
etppid1
    345064           +1.0%     348397       lkp-nex05/micro/will-it-scale/l=
ock1
   5753496           -1.3%    5677524       lkp-nex05/micro/will-it-scale/l=
seek1
   5776952           -2.3%    5646575       lkp-nex05/micro/will-it-scale/l=
seek2
     35088           +0.7%      35347       lkp-nex05/micro/will-it-scale/m=
alloc1
  11623486           +0.1%   11635334       lkp-nex05/micro/will-it-scale/m=
alloc2
    103875           +1.4%     105303       lkp-nex05/micro/will-it-scale/m=
map1
     92210           +1.8%      93837       lkp-nex05/micro/will-it-scale/m=
map2
    112633           -2.2%     110170       lkp-nex05/micro/will-it-scale/o=
pen1
    107165           -2.0%     105051       lkp-nex05/micro/will-it-scale/o=
pen2
    184683           -0.3%     184206       lkp-nex05/micro/will-it-scale/p=
age_fault1
     66888           +2.5%      68532       lkp-nex05/micro/will-it-scale/p=
age_fault2
    257263           -1.7%     252884       lkp-nex05/micro/will-it-scale/p=
age_fault3
   1098015           -0.8%    1089593       lkp-nex05/micro/will-it-scale/p=
ipe1
   4123533           +0.6%    4147058       lkp-nex05/micro/will-it-scale/p=
oll1
    180887           +0.0%     180909       lkp-nex05/micro/will-it-scale/p=
oll2
  30445539           -2.4%   29729133       lkp-nex05/micro/will-it-scale/p=
osix_semaphore1
   1837501           -0.6%    1826696       lkp-nex05/micro/will-it-scale/p=
read1
    404434           -0.8%     401370       lkp-nex05/micro/will-it-scale/p=
read2
   8437230           +0.1%    8446058       lkp-nex05/micro/will-it-scale/p=
thread_mutex1
  32451634           -0.0%   32439441       lkp-nex05/micro/will-it-scale/p=
thread_mutex2
   1317035           +0.6%    1324990       lkp-nex05/micro/will-it-scale/p=
write1
    292847           -0.6%     291067       lkp-nex05/micro/will-it-scale/p=
write2
   1200860           +0.0%    1201136       lkp-nex05/micro/will-it-scale/r=
ead1
    916213           +3.1%     944977       lkp-nex05/micro/will-it-scale/r=
ead2
   1329555           -1.0%    1315714       lkp-nex05/micro/will-it-scale/r=
eadseek
   2823788           -3.2%    2732160       lkp-nex05/micro/will-it-scale/s=
ched_yield
    143255          -14.2%     122894       lkp-nex05/micro/will-it-scale/s=
ignal1
    746995           +0.4%     749850       lkp-nex05/micro/will-it-scale/u=
nix1
     36044           -3.8%      34666       lkp-nex05/micro/will-it-scale/u=
nlink1
     40371           -3.1%      39130       lkp-nex05/micro/will-it-scale/u=
nlink2
    983960           +0.6%     989561       lkp-nex05/micro/will-it-scale/w=
rite1
   1044083           +0.1%    1045292       lkp-nex05/micro/will-it-scale/w=
riteseek
    465191           -0.6%     462263       lkp-sbx04/micro/will-it-scale/b=
rk1
    293156           -0.1%     292909       lkp-sbx04/micro/will-it-scale/c=
ontext_switch1
   2350746           -1.2%    2321524       lkp-sbx04/micro/will-it-scale/e=
ventfd1
   1240716           -0.3%    1237338       lkp-sbx04/micro/will-it-scale/f=
utex1
   1021864           -7.0%     949897       lkp-sbx04/micro/will-it-scale/f=
utex2
  11106430           +0.6%   11169039       lkp-sbx04/micro/will-it-scale/f=
utex3
   7568946           -9.5%    6846477       lkp-sbx04/micro/will-it-scale/f=
utex4
  18621666           +2.8%   19148791       lkp-sbx04/micro/will-it-scale/g=
etppid1
    547044           -2.2%     535140       lkp-sbx04/micro/will-it-scale/l=
ock1
   7764243           +1.2%    7854563       lkp-sbx04/micro/will-it-scale/l=
seek1
   7943121           -0.6%    7896003       lkp-sbx04/micro/will-it-scale/l=
seek2
     44579           +0.4%      44750       lkp-sbx04/micro/will-it-scale/m=
alloc1
  16106956           -0.2%   16082345       lkp-sbx04/micro/will-it-scale/m=
alloc2
    133509           -5.1%     126751       lkp-sbx04/micro/will-it-scale/m=
map1
    120080           -1.7%     117984       lkp-sbx04/micro/will-it-scale/m=
map2
    171506           -0.2%     171142       lkp-sbx04/micro/will-it-scale/o=
pen1
    167541           -1.6%     164870       lkp-sbx04/micro/will-it-scale/o=
pen2
    244178           -0.5%     242886       lkp-sbx04/micro/will-it-scale/p=
age_fault1
     99484           +0.1%      99591       lkp-sbx04/micro/will-it-scale/p=
age_fault2
    300809           +2.9%     309562       lkp-sbx04/micro/will-it-scale/p=
age_fault3
   1448903           -2.3%    1415325       lkp-sbx04/micro/will-it-scale/p=
ipe1
   5848566           -1.5%    5760066       lkp-sbx04/micro/will-it-scale/p=
oll1
    246371           -2.0%     241512       lkp-sbx04/micro/will-it-scale/p=
oll2
  37190319           -0.1%   37156667       lkp-sbx04/micro/will-it-scale/p=
osix_semaphore1
   2513516           -0.6%    2497445       lkp-sbx04/micro/will-it-scale/p=
read1
    461191           +0.3%     462731       lkp-sbx04/micro/will-it-scale/p=
read2
   6951101           +0.6%    6994956       lkp-sbx04/micro/will-it-scale/p=
thread_mutex1
  32909597           +0.1%   32942262       lkp-sbx04/micro/will-it-scale/p=
thread_mutex2
   1713748           -0.2%    1709591       lkp-sbx04/micro/will-it-scale/p=
write1
    329245           -0.4%     327867       lkp-sbx04/micro/will-it-scale/p=
write2
   1856622           +0.6%    1867073       lkp-sbx04/micro/will-it-scale/r=
ead1
   1042616           +0.9%    1052081       lkp-sbx04/micro/will-it-scale/r=
ead2
   1796589           +0.6%    1807848       lkp-sbx04/micro/will-it-scale/r=
eadseek
   4183446           -1.5%    4121507       lkp-sbx04/micro/will-it-scale/s=
ched_yield
    189328           +1.3%     191704       lkp-sbx04/micro/will-it-scale/s=
ignal1
   1090001           -1.4%    1074856       lkp-sbx04/micro/will-it-scale/u=
nix1
     51288           -1.0%      50780       lkp-sbx04/micro/will-it-scale/u=
nlink1
     68154           -1.5%      67149       lkp-sbx04/micro/will-it-scale/u=
nlink2
   1356098           +1.3%    1373172       lkp-sbx04/micro/will-it-scale/w=
rite1
   1351049           -0.7%    1342048       lkp-sbx04/micro/will-it-scale/w=
riteseek
    363037           +5.8%     384083       lkp-wsx01/micro/will-it-scale/b=
rk1
    157159           -2.3%     153477       lkp-wsx01/micro/will-it-scale/c=
ontext_switch1
   2046215           -1.7%    2012231       lkp-wsx01/micro/will-it-scale/e=
ventfd1
    936426           +0.9%     944867       lkp-wsx01/micro/will-it-scale/f=
utex1
    787255           -3.6%     758610       lkp-wsx01/micro/will-it-scale/f=
utex2
   9013415           +0.1%    9022277       lkp-wsx01/micro/will-it-scale/f=
utex3
   6403388           -7.8%    5906249       lkp-wsx01/micro/will-it-scale/f=
utex4
  15700385           -1.0%   15536026       lkp-wsx01/micro/will-it-scale/g=
etppid1
    341145           +2.8%     350599       lkp-wsx01/micro/will-it-scale/l=
ock1
   6827426           -0.6%    6784439       lkp-wsx01/micro/will-it-scale/l=
seek1
   6894426           -3.1%    6679502       lkp-wsx01/micro/will-it-scale/l=
seek2
     33170           +0.3%      33257       lkp-wsx01/micro/will-it-scale/m=
alloc1
  14362628           +0.0%   14365671       lkp-wsx01/micro/will-it-scale/m=
alloc2
     99714           +1.1%     100826       lkp-wsx01/micro/will-it-scale/m=
map1
     89939           +1.2%      91039       lkp-wsx01/micro/will-it-scale/m=
map2
    115887           -1.1%     114634       lkp-wsx01/micro/will-it-scale/o=
pen1
    107786           -0.2%     107580       lkp-wsx01/micro/will-it-scale/o=
pen2
    249156           +0.6%     250534       lkp-wsx01/micro/will-it-scale/p=
age_fault1
     70261           -0.4%      69996       lkp-wsx01/micro/will-it-scale/p=
age_fault2
    282800           -0.3%     281990       lkp-wsx01/micro/will-it-scale/p=
age_fault3
   1289824           -2.0%    1264579       lkp-wsx01/micro/will-it-scale/p=
ipe1
   4932384           +0.7%    4968287       lkp-wsx01/micro/will-it-scale/p=
oll1
    215307           +0.1%     215615       lkp-wsx01/micro/will-it-scale/p=
oll2
  38710852           +0.1%   38732602       lkp-wsx01/micro/will-it-scale/p=
osix_semaphore1
   2076022           -1.1%    2052501       lkp-wsx01/micro/will-it-scale/p=
read1
    369986           -0.2%     369332       lkp-wsx01/micro/will-it-scale/p=
read2
   8017889           +0.0%    8018634       lkp-wsx01/micro/will-it-scale/p=
thread_mutex1
  42120577           -0.0%   42109521       lkp-wsx01/micro/will-it-scale/p=
thread_mutex2
   1479043           +1.2%    1496552       lkp-wsx01/micro/will-it-scale/p=
write1
    267039           +1.0%     269656       lkp-wsx01/micro/will-it-scale/p=
write2
   1467543           +0.1%    1469690       lkp-wsx01/micro/will-it-scale/r=
ead1
    972147           -1.6%     956379       lkp-wsx01/micro/will-it-scale/r=
ead2
   1517366           -0.5%    1510067       lkp-wsx01/micro/will-it-scale/r=
eadseek
   3340748           -2.2%    3268718       lkp-wsx01/micro/will-it-scale/s=
ched_yield
    140328           -4.2%     134471       lkp-wsx01/micro/will-it-scale/s=
ignal1
    841886           +4.6%     880682       lkp-wsx01/micro/will-it-scale/u=
nix1
     35774           -3.4%      34555       lkp-wsx01/micro/will-it-scale/u=
nlink1
     49673           -6.2%      46575       lkp-wsx01/micro/will-it-scale/u=
nlink2
   1246057           -0.8%    1236376       lkp-wsx01/micro/will-it-scale/w=
rite1
   1188264           -1.1%    1175732       lkp-wsx01/micro/will-it-scale/w=
riteseek
    864337           +3.8%     896764       nhm4/micro/will-it-scale/brk1
    340327           -2.7%     330976       nhm4/micro/will-it-scale/contex=
t_switch1
   2448556           -0.1%    2445490       nhm4/micro/will-it-scale/eventf=
d1
   3831301           +0.8%    3860915       nhm4/micro/will-it-scale/futex1
   3516973           -6.8%    3276715       nhm4/micro/will-it-scale/futex2
  11023937           +1.1%   11141588       nhm4/micro/will-it-scale/futex3
   7871419           -7.1%    7311409       nhm4/micro/will-it-scale/futex4
  17223031           -0.6%   17115438       nhm4/micro/will-it-scale/getppi=
d1
   1978396           +2.0%    2017099       nhm4/micro/will-it-scale/lock1
   8458966           -0.3%    8429771       nhm4/micro/will-it-scale/lseek1
   8438203           -0.1%    8426304       nhm4/micro/will-it-scale/lseek2
     77261           -0.2%      77126       nhm4/micro/will-it-scale/malloc1
  16708958           -0.0%   16707098       nhm4/micro/will-it-scale/malloc2
    250561           +1.4%     254086       nhm4/micro/will-it-scale/mmap1
    220618           +2.4%     225852       nhm4/micro/will-it-scale/mmap2
    565540           -3.1%     547782       nhm4/micro/will-it-scale/open1
    548580           -3.0%     531996       nhm4/micro/will-it-scale/open2
    877895           -0.0%     877854       nhm4/micro/will-it-scale/page_f=
ault1
    302944           +1.0%     305968       nhm4/micro/will-it-scale/page_f=
ault2
   1029916           -0.7%    1022558       nhm4/micro/will-it-scale/page_f=
ault3
   1569532           -1.2%    1550359       nhm4/micro/will-it-scale/pipe1
   6093167           -0.2%    6083517       nhm4/micro/will-it-scale/poll1
    259149           -1.7%     254873       nhm4/micro/will-it-scale/poll2
  47645513           +0.2%   47724276       nhm4/micro/will-it-scale/posix_=
semaphore1
   2617955           +0.3%    2626023       nhm4/micro/will-it-scale/pread1
   1174927           -3.7%    1132027       nhm4/micro/will-it-scale/pread2
  18369836           +1.7%   18677292       nhm4/micro/will-it-scale/pthrea=
d_mutex1
  47294342           -0.0%   47291947       nhm4/micro/will-it-scale/pthrea=
d_mutex2
   1878906           +1.4%    1906094       nhm4/micro/will-it-scale/pwrite1
    759138           +1.0%     766676       nhm4/micro/will-it-scale/pwrite2
   1710102           +1.3%    1732480       nhm4/micro/will-it-scale/read1
   1904805           -0.2%    1901663       nhm4/micro/will-it-scale/read2
   1896547           +0.6%    1907086       nhm4/micro/will-it-scale/readse=
ek
   4169552           -2.8%    4050763       nhm4/micro/will-it-scale/sched_=
yield
    488178           -7.5%     451370       nhm4/micro/will-it-scale/signal1
   1065121           +0.9%    1074564       nhm4/micro/will-it-scale/unix1
    120814           -2.5%     117746       nhm4/micro/will-it-scale/unlink1
    185941           +0.1%     186135       nhm4/micro/will-it-scale/unlink2
   1222143           +1.1%    1235577       nhm4/micro/will-it-scale/write1
   1486829           +1.4%    1508300       nhm4/micro/will-it-scale/writes=
eek
1068377494           -0.9% 1059252055       TOTAL will-it-scale.per_thread_=
ops

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      0.42           +7.3%       0.45       brickland1/micro/will-it-scale/=
brk1
      1.00           +3.2%       1.03       brickland1/micro/will-it-scale/=
context_switch1
      0.50           -7.5%       0.46       brickland1/micro/will-it-scale/=
eventfd1
      0.58           +2.4%       0.60       brickland1/micro/will-it-scale/=
futex1
      0.56          -57.4%       0.24       brickland1/micro/will-it-scale/=
futex2
      0.60           -5.6%       0.57       brickland1/micro/will-it-scale/=
futex3
      0.50          +25.3%       0.62       brickland1/micro/will-it-scale/=
futex4
      0.66           +3.8%       0.68       brickland1/micro/will-it-scale/=
getppid1
      0.42           +0.9%       0.43       brickland1/micro/will-it-scale/=
lock1
      0.58           +2.2%       0.60       brickland1/micro/will-it-scale/=
lseek1
      0.59           +0.2%       0.59       brickland1/micro/will-it-scale/=
lseek2
      0.02           +0.6%       0.02       brickland1/micro/will-it-scale/=
malloc1
      0.37           +0.0%       0.37       brickland1/micro/will-it-scale/=
malloc2
      0.01           -2.0%       0.01       brickland1/micro/will-it-scale/=
mmap1
      0.01           +3.7%       0.01       brickland1/micro/will-it-scale/=
mmap2
      0.42           +1.2%       0.42       brickland1/micro/will-it-scale/=
open1
      0.30          +39.3%       0.41       brickland1/micro/will-it-scale/=
open2
      0.21           -0.9%       0.21       brickland1/micro/will-it-scale/=
page_fault1
      0.20           +0.0%       0.20       brickland1/micro/will-it-scale/=
page_fault2
      0.34          -61.3%       0.13       brickland1/micro/will-it-scale/=
page_fault3
      0.47           +1.3%       0.48       brickland1/micro/will-it-scale/=
pipe1
      0.27          +97.8%       0.53       brickland1/micro/will-it-scale/=
poll1
      0.41           -0.5%       0.41       brickland1/micro/will-it-scale/=
poll2
      0.56           +0.0%       0.56       brickland1/micro/will-it-scale/=
posix_semaphore1
      0.42           -2.1%       0.41       brickland1/micro/will-it-scale/=
pread1
      0.00           +8.5%       0.00       brickland1/micro/will-it-scale/=
pread2
      0.64          +11.4%       0.72       brickland1/micro/will-it-scale/=
pthread_mutex1
      0.62           -0.2%       0.62       brickland1/micro/will-it-scale/=
pthread_mutex2
      0.46           +2.6%       0.47       brickland1/micro/will-it-scale/=
pwrite1
      0.00          -26.8%       0.00       brickland1/micro/will-it-scale/=
pwrite2
      0.43           -4.0%       0.41       brickland1/micro/will-it-scale/=
read1
      0.06          -15.5%       0.05       brickland1/micro/will-it-scale/=
read2
      0.42          -37.4%       0.27       brickland1/micro/will-it-scale/=
readseek
      0.44          -48.4%       0.23       brickland1/micro/will-it-scale/=
sched_yield
      0.05           +8.9%       0.05       brickland1/micro/will-it-scale/=
signal1
      0.47           +2.4%       0.48       brickland1/micro/will-it-scale/=
unix1
      0.01           +1.3%       0.01       brickland1/micro/will-it-scale/=
unlink1
      0.01           +8.7%       0.01       brickland1/micro/will-it-scale/=
unlink2
      0.44           +0.7%       0.44       brickland1/micro/will-it-scale/=
write1
      0.50           -1.2%       0.49       brickland1/micro/will-it-scale/=
writeseek
      0.51          +88.0%       0.95       kbuildx/micro/will-it-scale/brk1
      0.38          +51.7%       0.57       kbuildx/micro/will-it-scale/con=
text_switch1
      0.92          -32.2%       0.62       kbuildx/micro/will-it-scale/eve=
ntfd1
      0.83          -35.4%       0.54       kbuildx/micro/will-it-scale/fut=
ex1
      0.88          +34.4%       1.18       kbuildx/micro/will-it-scale/fut=
ex2
      0.90           +1.9%       0.92       kbuildx/micro/will-it-scale/fut=
ex3
      0.91           -2.3%       0.89       kbuildx/micro/will-it-scale/fut=
ex4
      0.74           -4.9%       0.70       kbuildx/micro/will-it-scale/get=
ppid1
      0.80           -3.0%       0.78       kbuildx/micro/will-it-scale/loc=
k1
      0.95           -5.9%       0.90       kbuildx/micro/will-it-scale/lse=
ek1
      0.94          +50.0%       1.41       kbuildx/micro/will-it-scale/lse=
ek2
      0.76          -17.1%       0.63       kbuildx/micro/will-it-scale/mal=
loc1
      1.06          -16.9%       0.88       kbuildx/micro/will-it-scale/mal=
loc2
      0.90           -8.4%       0.82       kbuildx/micro/will-it-scale/mma=
p1
      0.94           -4.7%       0.90       kbuildx/micro/will-it-scale/mma=
p2
      0.36         +144.2%       0.89       kbuildx/micro/will-it-scale/ope=
n1
      1.73          -79.2%       0.36       kbuildx/micro/will-it-scale/ope=
n2
      0.61          -17.4%       0.50       kbuildx/micro/will-it-scale/pag=
e_fault1
      0.60          +10.2%       0.66       kbuildx/micro/will-it-scale/pag=
e_fault2
      0.60           -1.3%       0.59       kbuildx/micro/will-it-scale/pag=
e_fault3
      0.91           +2.9%       0.94       kbuildx/micro/will-it-scale/pip=
e1
      0.60          +52.8%       0.92       kbuildx/micro/will-it-scale/pol=
l1
      0.50           +0.4%       0.50       kbuildx/micro/will-it-scale/pol=
l2
      0.81           +0.9%       0.82       kbuildx/micro/will-it-scale/pos=
ix_semaphore1
      1.21          -41.0%       0.71       kbuildx/micro/will-it-scale/pre=
ad1
      0.20          +24.4%       0.26       kbuildx/micro/will-it-scale/pre=
ad2
      0.94          +25.4%       1.18       kbuildx/micro/will-it-scale/pth=
read_mutex1
      0.87           +7.3%       0.94       kbuildx/micro/will-it-scale/pth=
read_mutex2
      0.92           -1.9%       0.91       kbuildx/micro/will-it-scale/pwr=
ite1
      0.15          -18.1%       0.13       kbuildx/micro/will-it-scale/pwr=
ite2
      0.82          -24.6%       0.62       kbuildx/micro/will-it-scale/rea=
d1
      0.55           +0.5%       0.55       kbuildx/micro/will-it-scale/rea=
d2
      0.83          +13.2%       0.94       kbuildx/micro/will-it-scale/rea=
dseek
      0.92           -3.7%       0.89       kbuildx/micro/will-it-scale/sch=
ed_yield
      0.91          -11.0%       0.81       kbuildx/micro/will-it-scale/sig=
nal1
      0.40         +134.3%       0.93       kbuildx/micro/will-it-scale/uni=
x1
      0.52          -44.1%       0.29       kbuildx/micro/will-it-scale/unl=
ink1
      1.27          -59.4%       0.52       kbuildx/micro/will-it-scale/unl=
ink2
      0.85          +88.3%       1.61       kbuildx/micro/will-it-scale/wri=
te1
      0.94           -0.6%       0.94       kbuildx/micro/will-it-scale/wri=
teseek
      0.58           +2.1%       0.59       lkp-a03/micro/will-it-scale/brk1
      1.03           +2.9%       1.06       lkp-a03/micro/will-it-scale/con=
text_switch1
      0.57           -4.9%       0.55       lkp-a03/micro/will-it-scale/eve=
ntfd1
      0.53           +7.5%       0.57       lkp-a03/micro/will-it-scale/fut=
ex1
      0.64          -11.8%       0.56       lkp-a03/micro/will-it-scale/fut=
ex2
      0.61           +6.9%       0.65       lkp-a03/micro/will-it-scale/fut=
ex3
      0.61           +4.9%       0.65       lkp-a03/micro/will-it-scale/fut=
ex4
      0.75           +0.3%       0.75       lkp-a03/micro/will-it-scale/get=
ppid1
      0.54           -9.8%       0.49       lkp-a03/micro/will-it-scale/loc=
k1
      0.71           +5.2%       0.74       lkp-a03/micro/will-it-scale/lse=
ek1
      0.70           -0.3%       0.70       lkp-a03/micro/will-it-scale/lse=
ek2
      0.61           +3.4%       0.64       lkp-a03/micro/will-it-scale/mal=
loc1
      0.62           +0.3%       0.62       lkp-a03/micro/will-it-scale/mal=
loc2
      0.58           -1.7%       0.57       lkp-a03/micro/will-it-scale/mma=
p1
      0.57           +2.4%       0.59       lkp-a03/micro/will-it-scale/mma=
p2
      0.64           +0.0%       0.64       lkp-a03/micro/will-it-scale/ope=
n1
      0.62           +0.2%       0.62       lkp-a03/micro/will-it-scale/ope=
n2
      0.32           +0.0%       0.32       lkp-a03/micro/will-it-scale/pag=
e_fault1
      0.48           +0.8%       0.49       lkp-a03/micro/will-it-scale/pag=
e_fault2
      0.51           +1.4%       0.51       lkp-a03/micro/will-it-scale/pag=
e_fault3
      0.53           -4.3%       0.51       lkp-a03/micro/will-it-scale/pip=
e1
      0.67           +0.9%       0.67       lkp-a03/micro/will-it-scale/pol=
l1
      0.69           +1.7%       0.70       lkp-a03/micro/will-it-scale/pol=
l2
      0.84           -1.3%       0.83       lkp-a03/micro/will-it-scale/pos=
ix_semaphore1
      0.47           +5.5%       0.49       lkp-a03/micro/will-it-scale/pre=
ad1
      0.38          -15.8%       0.32       lkp-a03/micro/will-it-scale/pre=
ad2
      0.81           -0.4%       0.81       lkp-a03/micro/will-it-scale/pth=
read_mutex1
      0.83           +0.1%       0.83       lkp-a03/micro/will-it-scale/pth=
read_mutex2
      0.51           -4.6%       0.48       lkp-a03/micro/will-it-scale/pwr=
ite1
      0.14          -11.9%       0.13       lkp-a03/micro/will-it-scale/pwr=
ite2
      0.64           -9.2%       0.58       lkp-a03/micro/will-it-scale/rea=
d1
      0.59          +33.6%       0.80       lkp-a03/micro/will-it-scale/rea=
d2
      0.44           +8.4%       0.47       lkp-a03/micro/will-it-scale/rea=
dseek
      0.52           +1.7%       0.53       lkp-a03/micro/will-it-scale/sch=
ed_yield
      0.58           +1.9%       0.60       lkp-a03/micro/will-it-scale/sig=
nal1
      0.62           -1.3%       0.61       lkp-a03/micro/will-it-scale/uni=
x1
      0.42           -3.1%       0.41       lkp-a03/micro/will-it-scale/unl=
ink1
      0.64           -0.9%       0.63       lkp-a03/micro/will-it-scale/unl=
ink2
      0.38           +5.6%       0.40       lkp-a03/micro/will-it-scale/wri=
te1
      0.54           -1.7%       0.53       lkp-a03/micro/will-it-scale/wri=
teseek
      0.41           +5.6%       0.44       lkp-nex05/micro/will-it-scale/b=
rk1
      1.17          +10.3%       1.29       lkp-nex05/micro/will-it-scale/c=
ontext_switch1
      0.48           +0.4%       0.48       lkp-nex05/micro/will-it-scale/e=
ventfd1
      0.55           -1.5%       0.54       lkp-nex05/micro/will-it-scale/f=
utex1
      0.55           +0.4%       0.55       lkp-nex05/micro/will-it-scale/f=
utex2
      0.54           +3.7%       0.56       lkp-nex05/micro/will-it-scale/f=
utex3
      0.52          +11.7%       0.58       lkp-nex05/micro/will-it-scale/f=
utex4
      0.66           +0.8%       0.67       lkp-nex05/micro/will-it-scale/g=
etppid1
      0.46           -1.7%       0.46       lkp-nex05/micro/will-it-scale/l=
ock1
      0.55           +4.2%       0.57       lkp-nex05/micro/will-it-scale/l=
seek1
      0.55           +3.6%       0.57       lkp-nex05/micro/will-it-scale/l=
seek2
      0.02           +7.6%       0.02       lkp-nex05/micro/will-it-scale/m=
alloc1
      0.43           +0.2%       0.43       lkp-nex05/micro/will-it-scale/m=
alloc2
      0.01          -19.0%       0.01       lkp-nex05/micro/will-it-scale/m=
map1
      0.01          +27.4%       0.01       lkp-nex05/micro/will-it-scale/m=
map2
      0.32           +1.9%       0.33       lkp-nex05/micro/will-it-scale/o=
pen1
      0.32           -0.9%       0.32       lkp-nex05/micro/will-it-scale/o=
pen2
      0.08           +0.7%       0.08       lkp-nex05/micro/will-it-scale/p=
age_fault1
      0.13           -1.5%       0.13       lkp-nex05/micro/will-it-scale/p=
age_fault2
      0.22           +0.5%       0.22       lkp-nex05/micro/will-it-scale/p=
age_fault3
      0.47           -0.4%       0.47       lkp-nex05/micro/will-it-scale/p=
ipe1
      0.54           -3.7%       0.52       lkp-nex05/micro/will-it-scale/p=
oll1
      0.45           -4.9%       0.42       lkp-nex05/micro/will-it-scale/p=
oll2
      0.38           -6.1%       0.35       lkp-nex05/micro/will-it-scale/p=
osix_semaphore1
      0.46           -0.2%       0.45       lkp-nex05/micro/will-it-scale/p=
read1
      0.00           +1.6%       0.00       lkp-nex05/micro/will-it-scale/p=
read2
      0.46           +0.0%       0.46       lkp-nex05/micro/will-it-scale/p=
thread_mutex1
      0.45           +0.0%       0.45       lkp-nex05/micro/will-it-scale/p=
thread_mutex2
      0.47           -0.6%       0.47       lkp-nex05/micro/will-it-scale/p=
write1
      0.00           -4.4%       0.00       lkp-nex05/micro/will-it-scale/p=
write2
      0.40           -2.0%       0.40       lkp-nex05/micro/will-it-scale/r=
ead1
      0.13           +3.1%       0.13       lkp-nex05/micro/will-it-scale/r=
ead2
      0.47           -0.4%       0.46       lkp-nex05/micro/will-it-scale/r=
eadseek
      0.46           +2.2%       0.47       lkp-nex05/micro/will-it-scale/s=
ched_yield
      0.04          -19.0%       0.03       lkp-nex05/micro/will-it-scale/s=
ignal1
      0.50           -6.2%       0.47       lkp-nex05/micro/will-it-scale/u=
nix1
      0.01           +0.5%       0.01       lkp-nex05/micro/will-it-scale/u=
nlink1
      0.02           +8.1%       0.02       lkp-nex05/micro/will-it-scale/u=
nlink2
      0.26           +4.2%       0.28       lkp-nex05/micro/will-it-scale/w=
rite1
      0.48           +0.8%       0.48       lkp-nex05/micro/will-it-scale/w=
riteseek
      0.51           -4.5%       0.49       lkp-sbx04/micro/will-it-scale/b=
rk1
      0.88          +29.1%       1.13       lkp-sbx04/micro/will-it-scale/c=
ontext_switch1
      0.54           -2.2%       0.53       lkp-sbx04/micro/will-it-scale/e=
ventfd1
      0.59           +2.5%       0.60       lkp-sbx04/micro/will-it-scale/f=
utex1
      0.59           +0.3%       0.59       lkp-sbx04/micro/will-it-scale/f=
utex2
      0.58           +5.2%       0.61       lkp-sbx04/micro/will-it-scale/f=
utex3
      0.62           +5.3%       0.65       lkp-sbx04/micro/will-it-scale/f=
utex4
      0.69           +2.9%       0.71       lkp-sbx04/micro/will-it-scale/g=
etppid1
      0.48           +4.2%       0.50       lkp-sbx04/micro/will-it-scale/l=
ock1
      0.72          -11.3%       0.64       lkp-sbx04/micro/will-it-scale/l=
seek1
      0.64           +1.3%       0.65       lkp-sbx04/micro/will-it-scale/l=
seek2
      0.02           +5.3%       0.02       lkp-sbx04/micro/will-it-scale/m=
alloc1
      0.46           -3.0%       0.45       lkp-sbx04/micro/will-it-scale/m=
alloc2
      0.01           -1.2%       0.01       lkp-sbx04/micro/will-it-scale/m=
map1
      0.01           -6.7%       0.01       lkp-sbx04/micro/will-it-scale/m=
map2
      0.34           -1.8%       0.33       lkp-sbx04/micro/will-it-scale/o=
pen1
      0.33           +0.3%       0.33       lkp-sbx04/micro/will-it-scale/o=
pen2
      0.04           -0.2%       0.04       lkp-sbx04/micro/will-it-scale/p=
age_fault1
      0.06           -2.2%       0.06       lkp-sbx04/micro/will-it-scale/p=
age_fault2
      0.58           -3.8%       0.56       lkp-sbx04/micro/will-it-scale/p=
age_fault3
      0.58           -7.4%       0.54       lkp-sbx04/micro/will-it-scale/p=
ipe1
      0.57           +8.2%       0.62       lkp-sbx04/micro/will-it-scale/p=
oll1
      0.46           -3.0%       0.45       lkp-sbx04/micro/will-it-scale/p=
oll2
      0.55           +0.0%       0.55       lkp-sbx04/micro/will-it-scale/p=
osix_semaphore1
      0.51           +2.0%       0.52       lkp-sbx04/micro/will-it-scale/p=
read1
      0.00           -0.7%       0.00       lkp-sbx04/micro/will-it-scale/p=
read2
      0.72           +0.7%       0.73       lkp-sbx04/micro/will-it-scale/p=
thread_mutex1
      0.68           +3.7%       0.70       lkp-sbx04/micro/will-it-scale/p=
thread_mutex2
      0.56           -0.7%       0.56       lkp-sbx04/micro/will-it-scale/p=
write1
      0.00           +7.3%       0.00       lkp-sbx04/micro/will-it-scale/p=
write2
      0.47           -2.6%       0.45       lkp-sbx04/micro/will-it-scale/r=
ead1
      0.06           +3.3%       0.06       lkp-sbx04/micro/will-it-scale/r=
ead2
      0.53           -2.3%       0.52       lkp-sbx04/micro/will-it-scale/r=
eadseek
      0.49           -0.6%       0.49       lkp-sbx04/micro/will-it-scale/s=
ched_yield
      0.04           -6.1%       0.04       lkp-sbx04/micro/will-it-scale/s=
ignal1
      0.54           +1.5%       0.55       lkp-sbx04/micro/will-it-scale/u=
nix1
      0.01           +6.3%       0.01       lkp-sbx04/micro/will-it-scale/u=
nlink1
      0.02           +5.2%       0.02       lkp-sbx04/micro/will-it-scale/u=
nlink2
      0.41          +20.3%       0.50       lkp-sbx04/micro/will-it-scale/w=
rite1
      0.57           -0.5%       0.57       lkp-sbx04/micro/will-it-scale/w=
riteseek
      0.47           +6.0%       0.50       lkp-wsx01/micro/will-it-scale/b=
rk1
      1.64           -0.6%       1.63       lkp-wsx01/micro/will-it-scale/c=
ontext_switch1
      0.50           +2.8%       0.51       lkp-wsx01/micro/will-it-scale/e=
ventfd1
      0.62           -1.8%       0.61       lkp-wsx01/micro/will-it-scale/f=
utex1
      0.63           -2.2%       0.62       lkp-wsx01/micro/will-it-scale/f=
utex2
      0.60           +3.5%       0.62       lkp-wsx01/micro/will-it-scale/f=
utex3
      0.60           +8.0%       0.65       lkp-wsx01/micro/will-it-scale/f=
utex4
      0.73           -4.2%       0.70       lkp-wsx01/micro/will-it-scale/g=
etppid1
      0.52           -2.1%       0.51       lkp-wsx01/micro/will-it-scale/l=
ock1
      0.61           +1.6%       0.62       lkp-wsx01/micro/will-it-scale/l=
seek1
      0.61           +2.3%       0.62       lkp-wsx01/micro/will-it-scale/l=
seek2
      0.02           +3.0%       0.02       lkp-wsx01/micro/will-it-scale/m=
alloc1
      0.48           +0.2%       0.48       lkp-wsx01/micro/will-it-scale/m=
alloc2
      0.01          -19.0%       0.01       lkp-wsx01/micro/will-it-scale/m=
map1
      0.01          +21.5%       0.01       lkp-wsx01/micro/will-it-scale/m=
map2
      0.38           -3.1%       0.37       lkp-wsx01/micro/will-it-scale/o=
pen1
      0.39           -1.8%       0.38       lkp-wsx01/micro/will-it-scale/o=
pen2
      0.14           -0.7%       0.14       lkp-wsx01/micro/will-it-scale/p=
age_fault1
      0.20           -1.0%       0.20       lkp-wsx01/micro/will-it-scale/p=
age_fault2
      0.35           +3.2%       0.36       lkp-wsx01/micro/will-it-scale/p=
age_fault3
      0.54           -1.1%       0.53       lkp-wsx01/micro/will-it-scale/p=
ipe1
      0.60           -3.7%       0.57       lkp-wsx01/micro/will-it-scale/p=
oll1
      0.49           -1.8%       0.48       lkp-wsx01/micro/will-it-scale/p=
oll2
      0.62           -0.6%       0.61       lkp-wsx01/micro/will-it-scale/p=
osix_semaphore1
      0.54           -2.8%       0.53       lkp-wsx01/micro/will-it-scale/p=
read1
      0.00           +6.7%       0.00       lkp-wsx01/micro/will-it-scale/p=
read2
      0.51           +0.2%       0.51       lkp-wsx01/micro/will-it-scale/p=
thread_mutex1
      0.50           -0.2%       0.50       lkp-wsx01/micro/will-it-scale/p=
thread_mutex2
      0.57           -1.9%       0.56       lkp-wsx01/micro/will-it-scale/p=
write1
      0.00           +5.0%       0.00       lkp-wsx01/micro/will-it-scale/p=
write2
      0.54           -3.9%       0.52       lkp-wsx01/micro/will-it-scale/r=
ead1
      0.06          -19.8%       0.05       lkp-wsx01/micro/will-it-scale/r=
ead2
      0.57           -4.6%       0.54       lkp-wsx01/micro/will-it-scale/r=
eadseek
      0.53           +2.7%       0.54       lkp-wsx01/micro/will-it-scale/s=
ched_yield
      0.06          +14.4%       0.06       lkp-wsx01/micro/will-it-scale/s=
ignal1
      0.54           -6.5%       0.50       lkp-wsx01/micro/will-it-scale/u=
nix1
      0.01           +5.7%       0.01       lkp-wsx01/micro/will-it-scale/u=
nlink1
      0.01           +4.3%       0.01       lkp-wsx01/micro/will-it-scale/u=
nlink2
      0.55           -2.9%       0.53       lkp-wsx01/micro/will-it-scale/w=
rite1
      0.57           -3.0%       0.56       lkp-wsx01/micro/will-it-scale/w=
riteseek
      0.49           +6.7%       0.52       nhm4/micro/will-it-scale/brk1
      1.24          +12.9%       1.40       nhm4/micro/will-it-scale/contex=
t_switch1
      0.56           +0.2%       0.56       nhm4/micro/will-it-scale/eventf=
d1
      0.66           -1.4%       0.65       nhm4/micro/will-it-scale/futex1
      0.68           +0.6%       0.68       nhm4/micro/will-it-scale/futex2
      0.64           +0.3%       0.65       nhm4/micro/will-it-scale/futex3
      0.65           +6.6%       0.69       nhm4/micro/will-it-scale/futex4
      0.99           +1.0%       1.00       nhm4/micro/will-it-scale/getppi=
d1
      0.54           +1.5%       0.55       nhm4/micro/will-it-scale/lock1
      0.67           -0.7%       0.66       nhm4/micro/will-it-scale/lseek1
      0.64           +4.2%       0.66       nhm4/micro/will-it-scale/lseek2
      0.54           +0.4%       0.54       nhm4/micro/will-it-scale/malloc1
      0.51           +0.0%       0.51       nhm4/micro/will-it-scale/malloc2
      0.54           +0.6%       0.55       nhm4/micro/will-it-scale/mmap1
      0.53           -0.8%       0.52       nhm4/micro/will-it-scale/mmap2
      0.51           +4.9%       0.53       nhm4/micro/will-it-scale/open1
      0.52           +4.6%       0.54       nhm4/micro/will-it-scale/open2
      0.13           -0.8%       0.13       nhm4/micro/will-it-scale/page_f=
ault1
      0.29           +0.3%       0.29       nhm4/micro/will-it-scale/page_f=
ault2
      0.58           +4.8%       0.61       nhm4/micro/will-it-scale/page_f=
ault3
      0.56           -1.6%       0.55       nhm4/micro/will-it-scale/pipe1
      0.62           -2.2%       0.61       nhm4/micro/will-it-scale/poll1
      0.49           +4.9%       0.52       nhm4/micro/will-it-scale/poll2
      0.63           +0.0%       0.63       nhm4/micro/will-it-scale/posix_=
semaphore1
      0.55           +0.4%       0.55       nhm4/micro/will-it-scale/pread1
      0.07           +0.4%       0.07       nhm4/micro/will-it-scale/pread2
      0.54           +0.0%       0.54       nhm4/micro/will-it-scale/pthrea=
d_mutex1
      0.54           +0.0%       0.54       nhm4/micro/will-it-scale/pthrea=
d_mutex2
      0.55           +1.5%       0.56       nhm4/micro/will-it-scale/pwrite1
      0.06           +0.3%       0.06       nhm4/micro/will-it-scale/pwrite2
      0.34          +11.8%       0.38       nhm4/micro/will-it-scale/read1
      0.56           +1.6%       0.57       nhm4/micro/will-it-scale/read2
      0.56           -0.7%       0.56       nhm4/micro/will-it-scale/readse=
ek
      0.54           +4.4%       0.57       nhm4/micro/will-it-scale/sched_=
yield
      0.62           +0.6%       0.62       nhm4/micro/will-it-scale/signal1
      0.58           -6.9%       0.54       nhm4/micro/will-it-scale/unix1
      0.15           +2.7%       0.15       nhm4/micro/will-it-scale/unlink1
      0.48           +8.2%       0.52       nhm4/micro/will-it-scale/unlink2
      0.26           +2.3%       0.27       nhm4/micro/will-it-scale/write1
      0.58           -3.8%       0.56       nhm4/micro/will-it-scale/writes=
eek
    139.21           +0.2%     139.51       TOTAL will-it-scale.scalability

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

    896.48           +0.4%     899.77       brickland1/micro/pigz/100%
   1394.82           -7.4%    1291.99       brickland1/micro/pigz/25%
    675.07           +3.0%     695.33       brickland1/micro/will-it-scale/=
brk1
    528.10           +0.1%     528.60       brickland1/micro/will-it-scale/=
context_switch1
   1232.38           -0.9%    1221.17       brickland1/micro/will-it-scale/=
eventfd1
    617.97           -3.1%     598.79       brickland1/micro/will-it-scale/=
futex1
    681.68           +1.1%     689.16       brickland1/micro/will-it-scale/=
futex2
   1339.11           -5.5%    1265.41       brickland1/micro/will-it-scale/=
futex3
   1333.33           -4.7%    1270.45       brickland1/micro/will-it-scale/=
futex4
   1156.80           -6.4%    1082.54       brickland1/micro/will-it-scale/=
getppid1
    783.59           +4.8%     821.20       brickland1/micro/will-it-scale/=
lock1
   1211.73           +4.3%    1264.28       brickland1/micro/will-it-scale/=
lseek1
   1242.33           +1.8%    1264.49       brickland1/micro/will-it-scale/=
lseek2
    194.42           +2.9%     200.04       brickland1/micro/will-it-scale/=
malloc1
   1563.43           -4.0%    1500.54       brickland1/micro/will-it-scale/=
malloc2
    191.94           -1.2%     189.62       brickland1/micro/will-it-scale/=
mmap1
    202.42           -1.7%     198.89       brickland1/micro/will-it-scale/=
mmap2
    795.40           -0.9%     787.94       brickland1/micro/will-it-scale/=
open1
    785.32           -0.6%     780.79       brickland1/micro/will-it-scale/=
open2
    298.61           -1.2%     294.92       brickland1/micro/will-it-scale/=
page_fault1
    414.32           +0.2%     415.26       brickland1/micro/will-it-scale/=
page_fault2
    379.56           +1.5%     385.28       brickland1/micro/will-it-scale/=
page_fault3
   1226.61           -3.8%    1180.01       brickland1/micro/will-it-scale/=
pipe1
   1260.92           +5.6%    1331.17       brickland1/micro/will-it-scale/=
poll1
   1627.51           -5.6%    1535.89       brickland1/micro/will-it-scale/=
poll2
    508.51           +1.1%     514.15       brickland1/micro/will-it-scale/=
posix_semaphore1
   1811.15           +1.4%    1836.13       brickland1/micro/will-it-scale/=
pread1
    235.02           +0.5%     236.17       brickland1/micro/will-it-scale/=
pread2
    783.77           -1.5%     772.22       brickland1/micro/will-it-scale/=
pthread_mutex1
    965.82           +0.4%     969.84       brickland1/micro/will-it-scale/=
pthread_mutex2
   1211.07           -3.3%    1171.11       brickland1/micro/will-it-scale/=
pwrite1
    350.63           -0.0%     350.62       brickland1/micro/will-it-scale/=
pwrite2
   1215.78           +0.8%    1225.10       brickland1/micro/will-it-scale/=
read1
    609.61           +1.9%     621.37       brickland1/micro/will-it-scale/=
read2
   1272.40           +8.0%    1373.72       brickland1/micro/will-it-scale/=
readseek
   1197.68           -1.1%    1184.76       brickland1/micro/will-it-scale/=
sched_yield
    326.46           +6.9%     348.86       brickland1/micro/will-it-scale/=
signal1
   1160.14           +5.0%    1217.69       brickland1/micro/will-it-scale/=
unix1
    152.82           +0.2%     153.20       brickland1/micro/will-it-scale/=
unlink1
    327.50           -1.7%     321.95       brickland1/micro/will-it-scale/=
unlink2
   1248.38           +0.2%    1250.56       brickland1/micro/will-it-scale/=
write1
   1200.15           +1.5%    1218.15       brickland1/micro/will-it-scale/=
writeseek
    360.73           +0.5%     362.38       brickland2/micro/aim7/brk_test
    596.36           -0.2%     595.31       brickland2/micro/aim7/compute
    546.37           +2.3%     558.98       brickland2/micro/aim7/creat-clo
    577.77           +0.3%     579.64       brickland2/micro/aim7/dbase
    342.26           +2.9%     352.32       brickland2/micro/aim7/disk_src
    458.91           -0.4%     457.07       brickland2/micro/aim7/exec_test
    226.28           -3.5%     218.41       brickland2/micro/aim7/fork_test
    232.51           +6.8%     248.21       brickland2/micro/aim7/link_test
    440.56           -1.2%     435.41       brickland2/micro/aim7/misc_rtns=
_1
    363.40           -2.2%     355.47       brickland2/micro/aim7/shared
    434.90           +1.5%     441.22       brickland2/micro/aim7/shell_rtn=
s_1
    291.62           -2.1%     285.52       brickland2/micro/aim7/signal_te=
st
    898.32           -1.1%     888.14       brickland2/micro/aim7/sort_rtns=
_1
    714.78           -0.3%     712.63       brickland2/micro/aim7/string_rt=
ns
    644.76           +0.6%     648.75       brickland2/micro/aim7/trig_rtns
    593.37           -4.8%     564.99       brickland2/micro/hackbench/600%=
-process-pipe
    684.17           +1.4%     693.69       brickland2/micro/hackbench/600%=
-threads-pipe
    360.51           +0.6%     362.80       brickland2/micro/kbuild/200%-1H=
DD-ext4
    360.33           -0.8%     357.30       brickland2/micro/kbuild/200%
    369.85           -3.3%     357.66       brickland2/micro/kbuild/50%-1HD=
D-ext4
    366.48           -2.8%     356.33       brickland2/micro/kbuild/50%
    437.27           -1.2%     432.07       brickland2/micro/vm-scalability=
/300s-anon-cow-rand-64G
    420.06           +1.4%     426.10       brickland2/micro/vm-scalability=
/300s-anon-cow-rand-mt-64G
    372.43           +5.2%     391.90       brickland2/micro/vm-scalability=
/300s-anon-cow-seq-1T
    454.79           -1.1%     449.77       brickland2/micro/vm-scalability=
/300s-anon-cow-seq-mt-1T
    604.53           +0.2%     605.82       brickland2/micro/vm-scalability=
/300s-anon-r-rand-mt
    612.12           +0.4%     614.84       brickland2/micro/vm-scalability=
/300s-anon-r-rand
    755.49           +0.2%     756.68       brickland2/micro/vm-scalability=
/300s-anon-r-seq-mt
    768.21           -0.1%     767.76       brickland2/micro/vm-scalability=
/300s-anon-r-seq
    647.62           -0.2%     646.29       brickland2/micro/vm-scalability=
/300s-anon-rx-rand-mt
    767.71           -0.0%     767.54       brickland2/micro/vm-scalability=
/300s-anon-rx-seq-mt
    447.41           -2.5%     436.37       brickland2/micro/vm-scalability=
/300s-anon-w-rand-64G
    427.60           -5.3%     404.79       brickland2/micro/vm-scalability=
/300s-anon-w-rand-mt-64G
    464.81           -0.3%     463.41       brickland2/micro/vm-scalability=
/300s-anon-w-seq-1T
    365.49           +0.1%     365.91       brickland2/micro/vm-scalability=
/300s-anon-w-seq-mt-64G
    427.31           -0.7%     424.47       brickland2/micro/vm-scalability=
/300s-anon-wx-rand-mt-64G
    556.32           -0.3%     554.76       brickland2/micro/vm-scalability=
/300s-anon-wx-seq-mt-1T
    388.08           +0.7%     390.73       brickland2/micro/vm-scalability=
/300s-lru-file-mmap-read-rand
    460.23           +0.5%     462.41       brickland2/micro/vm-scalability=
/300s-lru-file-mmap-read
    449.39           +0.1%     449.70       brickland2/micro/vm-scalability=
/300s-lru-file-readonce
    449.13           -0.3%     447.74       brickland2/micro/vm-scalability=
/300s-lru-file-readtwice
    136.17           -0.4%     135.64       brickland2/micro/vm-scalability=
/300s-lru-shm-128G
    221.34           +7.4%     237.75       brickland2/micro/vm-scalability=
/300s-lru-shm-rand-64G
     46.76           -0.8%      46.39       brickland2/micro/vm-scalability=
/300s-migrate
    325.52           +5.3%     342.78       brickland2/micro/vm-scalability=
/300s-mmap-pread-rand-mt
    337.22           +0.3%     338.37       brickland2/micro/vm-scalability=
/300s-mmap-pread-rand
    278.04           +0.6%     279.78       brickland2/micro/vm-scalability=
/300s-mmap-pread-seq-mt
    591.47           -0.0%     591.44       brickland2/micro/vm-scalability=
/300s-mmap-pread-seq
    460.30           +2.1%     469.90       brickland2/micro/vm-scalability=
/300s-mmap-xread-rand-mt
    455.68           +0.2%     456.78       brickland2/micro/vm-scalability=
/300s-mmap-xread-seq-mt
    398.30           +8.3%     431.32       brickland2/micro/vm-scalability=
/300s-mremap-xread-rand-mt
    254.33           -3.3%     245.84       brickland2/micro/vm-scalability=
/300s-msync-mt-64G
    209.55           -4.3%     200.52       brickland2/micro/vm-scalability=
/300s-remap-128G
    378.72           +0.6%     380.88       brickland2/micro/vm-scalability=
/300s-shm-pread-rand-16G
    121.04           -2.8%     117.67       brickland2/micro/vm-scalability=
/300s-shm-pread-rand-mt-16G
    557.24           -1.7%     547.58       brickland2/micro/vm-scalability=
/300s-shm-pread-seq-1T
    282.66           -0.8%     280.39       brickland2/micro/vm-scalability=
/300s-shm-pread-seq-mt-1T
    379.70           -0.0%     379.60       brickland2/micro/vm-scalability=
/300s-shm-xread-rand-16G
    347.43          +12.6%     391.04       brickland2/micro/vm-scalability=
/300s-shm-xread-rand-mt-16G
    559.32           -2.4%     546.15       brickland2/micro/vm-scalability=
/300s-shm-xread-seq-1T
    474.93           -0.3%     473.29       brickland2/micro/vm-scalability=
/300s-shm-xread-seq-mt-1T
    134.27           -1.8%     131.88       brickland2/micro/vm-scalability=
/300s-small-allocs-mt
    365.25           -9.8%     329.49       brickland2/micro/vm-scalability=
/300s-small-allocs
     51.08           +0.1%      51.11       brickland2/micro/vm-scalability=
/300s-truncate-16G
    163.31           +0.0%     163.31       grantley/micro/aim7/brk_test
    146.30           +0.2%     146.56       grantley/micro/aim7/compute
     85.55           -1.4%      84.31       grantley/micro/aim7/creat-clo
    155.63           +0.5%     156.45       grantley/micro/aim7/dbase
     77.47           +4.5%      80.92       grantley/micro/aim7/disk_src
     90.16           -0.2%      90.02       grantley/micro/aim7/exec_test
     84.63           +1.2%      85.62       grantley/micro/aim7/fork_test
     72.55           +4.4%      75.76       grantley/micro/aim7/link_test
    145.60           -1.1%     144.06       grantley/micro/aim7/mem_rtns_1
     88.53           -1.4%      87.30       grantley/micro/aim7/misc_rtns_1
    124.51           +0.4%     125.05       grantley/micro/aim7/shared
     97.55           +1.5%      99.01       grantley/micro/aim7/shell_rtns_1
    136.14           +0.1%     136.23       grantley/micro/aim7/signal_test
    139.98           +0.6%     140.87       grantley/micro/aim7/sort_rtns_1
    149.58           +0.5%     150.32       grantley/micro/aim7/string_rtns
    161.05           -0.5%     160.21       grantley/micro/aim7/trig_rtns
    141.31           -1.6%     139.10       grantley/micro/kbuild/200%-1HDD=
-ext4
    142.36           +0.5%     143.12       grantley/micro/kbuild/200%
    111.83           -0.1%     111.69       grantley/micro/kbuild/50%-1HDD-=
ext4
    111.63           -0.4%     111.19       grantley/micro/kbuild/50%
    217.47           +0.5%     218.50       grantley/micro/pigz/100%
    113.96           +2.3%     116.59       grantley/micro/pigz/25%
    398.08           +0.0%     398.18       lkp-sbx04/micro/netperf/300s-20=
0%-SCTP_RR
     58.74           -3.6%      56.65       lkp-sbx04/micro/netperf/300s-20=
0%-SCTP_STREAM
    343.10           +0.4%     344.42       lkp-sbx04/micro/netperf/300s-20=
0%-TCP_CRR
    402.79           +0.2%     403.40       lkp-sbx04/micro/netperf/300s-20=
0%-TCP_RR
    438.32           -0.7%     435.23       lkp-sbx04/micro/netperf/300s-20=
0%-TCP_SENDFILE
    339.85           +0.9%     342.81       lkp-sbx04/micro/netperf/300s-20=
0%-UDP_RR
    113.04           +1.7%     114.96       lkp-sbx04/micro/netperf/300s-25=
%-SCTP_RR
     57.23           -5.6%      54.01       lkp-sbx04/micro/netperf/300s-25=
%-SCTP_STREAM
    214.79           -0.4%     213.95       lkp-sbx04/micro/netperf/300s-25=
%-TCP_CRR
    114.11           -2.4%     111.35       lkp-sbx04/micro/netperf/300s-25=
%-TCP_RR
    340.78           -6.6%     318.40       lkp-sbx04/micro/netperf/300s-25=
%-TCP_SENDFILE
    107.98           -0.6%     107.29       lkp-sbx04/micro/netperf/300s-25=
%-UDP_RR
    124.80           +7.5%     134.13       lkp-sbx04/micro/netperf/900s-20=
0%-SCTP_STREAM_MANY
    332.80           -0.2%     332.27       lkp-sbx04/micro/netperf/900s-20=
0%-TCP_MAERTS
    331.22           +0.1%     331.41       lkp-sbx04/micro/netperf/900s-20=
0%-TCP_STREAM
    180.39          +22.1%     220.29       lkp-sbx04/micro/netperf/900s-25=
%-SCTP_STREAM_MANY
    277.15           -5.2%     262.73       lkp-sbx04/micro/netperf/900s-25=
%-TCP_MAERTS
    268.24           -1.2%     265.09       lkp-sbx04/micro/netperf/900s-25=
%-TCP_STREAM
    176.52           +0.2%     176.84       lkp-sbx04/micro/will-it-scale/b=
rk1
    272.42           -3.3%     263.39       lkp-sbx04/micro/will-it-scale/c=
ontext_switch1
    258.61           -0.7%     256.76       lkp-sbx04/micro/will-it-scale/e=
ventfd1
    236.58           +0.3%     237.33       lkp-sbx04/micro/will-it-scale/f=
utex1
    238.82           -0.2%     238.32       lkp-sbx04/micro/will-it-scale/f=
utex2
    250.74           -1.5%     247.05       lkp-sbx04/micro/will-it-scale/f=
utex3
    253.23           -0.8%     251.30       lkp-sbx04/micro/will-it-scale/f=
utex4
    248.00           +0.4%     248.89       lkp-sbx04/micro/will-it-scale/g=
etppid1
    246.85           -0.0%     246.75       lkp-sbx04/micro/will-it-scale/l=
ock1
    248.56           -0.2%     247.94       lkp-sbx04/micro/will-it-scale/l=
seek1
    249.56           -0.4%     248.52       lkp-sbx04/micro/will-it-scale/l=
seek2
    155.34           -0.1%     155.16       lkp-sbx04/micro/will-it-scale/m=
alloc1
    251.60           -0.1%     251.25       lkp-sbx04/micro/will-it-scale/m=
alloc2
    154.26           +0.3%     154.68       lkp-sbx04/micro/will-it-scale/m=
map1
    154.16           -0.9%     152.82       lkp-sbx04/micro/will-it-scale/m=
map2
    240.01           +1.3%     243.22       lkp-sbx04/micro/will-it-scale/o=
pen1
    242.97           -1.0%     240.62       lkp-sbx04/micro/will-it-scale/o=
pen2
    174.99           -0.5%     174.13       lkp-sbx04/micro/will-it-scale/p=
age_fault1
    176.55           +0.5%     177.50       lkp-sbx04/micro/will-it-scale/p=
age_fault2
    183.21           +0.8%     184.72       lkp-sbx04/micro/will-it-scale/p=
age_fault3
    263.69           -0.7%     261.77       lkp-sbx04/micro/will-it-scale/p=
ipe1
    253.37           +0.5%     254.57       lkp-sbx04/micro/will-it-scale/p=
oll1
    260.32           -0.5%     258.89       lkp-sbx04/micro/will-it-scale/p=
oll2
    230.70           +0.4%     231.51       lkp-sbx04/micro/will-it-scale/p=
osix_semaphore1
    277.75           +0.0%     277.81       lkp-sbx04/micro/will-it-scale/p=
read1
     93.27           +0.1%      93.34       lkp-sbx04/micro/will-it-scale/p=
read2
    239.56           -0.2%     239.16       lkp-sbx04/micro/will-it-scale/p=
thread_mutex1
    244.57           -0.1%     244.37       lkp-sbx04/micro/will-it-scale/p=
thread_mutex2
    270.51           -0.2%     269.97       lkp-sbx04/micro/will-it-scale/p=
write1
    181.86           +9.7%     199.58       lkp-sbx04/micro/will-it-scale/p=
write2
    298.71           +0.2%     299.40       lkp-sbx04/micro/will-it-scale/r=
ead1
    172.02           +1.2%     174.04       lkp-sbx04/micro/will-it-scale/r=
ead2
    272.25           +0.5%     273.60       lkp-sbx04/micro/will-it-scale/r=
eadseek
    260.33           +0.1%     260.57       lkp-sbx04/micro/will-it-scale/s=
ched_yield
    227.43           +0.1%     227.58       lkp-sbx04/micro/will-it-scale/s=
ignal1
    269.35           -0.6%     267.70       lkp-sbx04/micro/will-it-scale/u=
nix1
    200.42           +1.6%     203.72       lkp-sbx04/micro/will-it-scale/u=
nlink1
    230.76           -0.3%     229.96       lkp-sbx04/micro/will-it-scale/u=
nlink2
    277.15           +0.4%     278.21       lkp-sbx04/micro/will-it-scale/w=
rite1
    269.25           -0.3%     268.51       lkp-sbx04/micro/will-it-scale/w=
riteseek
     24.13           +0.2%      24.18       snb-drag/crypto/tcrypt/2s-200-2=
04
     23.53           +0.2%      23.58       snb-drag/crypto/tcrypt/2s-205-2=
10
     23.52           +0.6%      23.65       snb-drag/crypto/tcrypt/2s-301-3=
19
     24.14           -1.0%      23.89       snb-drag/crypto/tcrypt/2s-401-4=
17
     24.58           -0.5%      24.46       snb-drag/crypto/tcrypt/2s-500-5=
04
     24.28           -0.1%      24.26       snb-drag/crypto/tcrypt/2s-505-5=
09
      5.29           -0.2%       5.28       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrd-sync
      5.96           -0.7%       5.92       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrw-sync
      5.12           +1.8%       5.21       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndwr-sync
      7.06           +0.1%       7.07       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrd-sync
      8.02           -0.1%       8.01       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrewr-sync
      8.26           -0.8%       8.19       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqwr-sync
      5.68           -1.2%       5.61       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrd-sync
      5.69           -0.2%       5.68       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrw-sync
      4.68           -0.2%       4.67       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndwr-sync
      7.45           -0.3%       7.43       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrd-sync
      8.06           +0.4%       8.09       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrewr-sync
      8.12           +0.4%       8.15       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqwr-sync
     13.75           +0.4%      13.81       xbm/micro/iperf/300s-tcp
      5.20           +0.8%       5.24       xbm/micro/iperf/300s-udp
     13.20           -1.3%      13.03       xbm/micro/nuttcp/300s
     23.73           -1.3%      23.43       xbm/micro/pigz/100%
     14.45           +0.6%      14.53       xbm/micro/pigz/25%
     10.31           +2.2%      10.54       xbm/micro/thrulay/300s
  80828.27           -0.2%   80684.13       TOTAL turbostat.Pkg_W

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     81.49           +4.9%      85.51       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-rndrd-sync
     14.95         +330.0%      64.29       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-rndrw-sync
      0.07           +0.0%       0.07       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-rndwr-sync
      0.95           -6.3%       0.89       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-seqrd-sync
      0.08          +75.0%       0.14       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-seqrewr-sync
      0.13           +0.0%       0.13       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-seqwr-sync
     66.46          +22.3%      81.25       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-rndrd-sync
     34.45         +108.4%      71.80       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-rndrw-sync
      0.07           +0.0%       0.07       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-rndwr-sync
      0.76           +5.3%       0.80       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-seqrd-sync
      0.08          +12.5%       0.09       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-seqrewr-sync
      0.08          +12.5%       0.09       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-seqwr-sync
     46.24           -1.1%      45.72       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrd-sync
     43.53           +0.5%      43.75       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrw-sync
      0.03           +0.0%       0.03       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndwr-sync
      2.56           +0.0%       2.56       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrd-sync
      0.04           +0.0%       0.04       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrewr-sync
      0.05           +0.0%       0.05       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqwr-sync
     49.52           -0.3%      49.39       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrd-sync
     53.19           +0.3%      53.34       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrw-sync
      0.02           +0.0%       0.02       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndwr-sync
      2.57           +0.0%       2.57       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrd-sync
      0.03           +0.0%       0.03       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrewr-sync
      0.04           +0.0%       0.04       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqwr-sync
      0.06          +66.7%       0.10       stoakley/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrewr-sync
      0.05          -20.0%       0.04       stoakley/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndwr-sync
      0.10           +0.0%       0.10       stoakley/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqwr-sync
    397.60          +26.5%     502.91       TOTAL fileio.request_latency_95=
%_ms

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      2.14           -0.0%       2.14       avoton2/micro/netperf/300s-200%=
-SCTP_STREAM
   5564.16           -0.3%    5545.90       avoton2/micro/netperf/300s-200%=
-TCP_SENDFILE
     30.97           +4.8%      32.45       avoton2/micro/netperf/900s-200%=
-SCTP_STREAM_MANY
    909.60           +0.5%     914.31       avoton2/micro/netperf/900s-200%=
-TCP_MAERTS
    897.60           +0.4%     901.32       avoton2/micro/netperf/900s-200%=
-TCP_STREAM
      2.14           +0.1%       2.14       kbuildx/micro/netperf/300s-200%=
-SCTP_STREAM
  19480.29           +0.8%   19629.33       kbuildx/micro/netperf/300s-200%=
-TCP_SENDFILE
     19.16          +66.6%      31.93       kbuildx/micro/netperf/900s-200%=
-SCTP_STREAM_MANY
   9860.59          -18.9%    7997.32       kbuildx/micro/netperf/900s-200%=
-TCP_MAERTS
   6528.43           +2.8%    6713.42       kbuildx/micro/netperf/900s-200%=
-TCP_STREAM
      2.14           +0.0%       2.14       lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
   9466.76           +0.2%    9486.76       lkp-nex04/micro/netperf/300s-20=
0%-TCP_SENDFILE
     14.85          -16.4%      12.42       lkp-nex04/micro/netperf/900s-20=
0%-SCTP_STREAM_MANY
    618.81           +0.1%     619.19       lkp-nex04/micro/netperf/900s-20=
0%-TCP_MAERTS
    619.16           +0.0%     619.25       lkp-nex04/micro/netperf/900s-20=
0%-TCP_STREAM
      2.14           +0.0%       2.14       lkp-nex05/micro/netperf/300s-20=
0%-SCTP_STREAM
   7999.01           +0.8%    8063.04       lkp-nex05/micro/netperf/300s-20=
0%-TCP_SENDFILE
     42.19          -27.2%      30.73       lkp-nex05/micro/netperf/900s-20=
0%-SCTP_STREAM_MANY
    666.95           -0.2%     665.58       lkp-nex05/micro/netperf/900s-20=
0%-TCP_MAERTS
    710.23           +0.0%     710.51       lkp-nex05/micro/netperf/900s-20=
0%-TCP_STREAM
      2.14           +0.0%       2.14       lkp-sbx04/micro/netperf/300s-20=
0%-SCTP_STREAM
  12868.51           -0.3%   12834.84       lkp-sbx04/micro/netperf/300s-20=
0%-TCP_SENDFILE
      2.14           +0.0%       2.14       lkp-sbx04/micro/netperf/300s-25=
%-SCTP_STREAM
  44370.88           -6.2%   41613.61       lkp-sbx04/micro/netperf/300s-25=
%-TCP_SENDFILE
    124.63          +18.0%     147.06       lkp-sbx04/micro/netperf/900s-20=
0%-SCTP_STREAM_MANY
    712.33           -0.1%     711.96       lkp-sbx04/micro/netperf/900s-20=
0%-TCP_MAERTS
    709.23           +0.1%     710.22       lkp-sbx04/micro/netperf/900s-20=
0%-TCP_STREAM
   1764.82          +49.9%    2644.84       lkp-sbx04/micro/netperf/900s-25=
%-SCTP_STREAM_MANY
  18509.15           -6.4%   17329.59       lkp-sbx04/micro/netperf/900s-25=
%-TCP_MAERTS
  16561.31           +1.1%   16741.61       lkp-sbx04/micro/netperf/900s-25=
%-TCP_STREAM
      2.14           +0.1%       2.14       lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
   4827.25           +1.1%    4882.11       lkp-t410/micro/netperf/300s-200=
%-TCP_SENDFILE
    198.26          -79.7%      40.31       lkp-t410/micro/netperf/900s-200=
%-SCTP_STREAM_MANY
   2147.89           +0.6%    2160.07       lkp-t410/micro/netperf/900s-200=
%-TCP_MAERTS
   2161.03           +0.8%    2179.04       lkp-t410/micro/netperf/900s-200=
%-TCP_STREAM
      2.14           +0.0%       2.14       lkp-wsx02/micro/netperf/300s-20=
0%-SCTP_STREAM
   9839.28           +0.9%    9932.55       lkp-wsx02/micro/netperf/300s-20=
0%-TCP_SENDFILE
     19.79          +20.2%      23.79       lkp-wsx02/micro/netperf/900s-20=
0%-SCTP_STREAM_MANY
   1914.40           +0.0%    1914.79       lkp-wsx02/micro/netperf/900s-20=
0%-TCP_MAERTS
   1911.33           +0.1%    1913.11       lkp-wsx02/micro/netperf/900s-20=
0%-TCP_STREAM
 182085.96           -2.4%  177770.05       TOTAL netperf.Throughput_Mbps

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

   1493736           -0.8%    1481518       brickland2/micro/vm-scalability=
/300s-anon-cow-rand-64G
   1726714           -3.3%    1669647       brickland2/micro/vm-scalability=
/300s-anon-cow-rand-mt-64G
  11059784           +1.5%   11222865       brickland2/micro/vm-scalability=
/300s-anon-cow-seq-1T
  18043597           +5.7%   19066716       brickland2/micro/vm-scalability=
/300s-anon-cow-seq-mt-1T
   4512294           +0.0%    4512794       brickland2/micro/vm-scalability=
/300s-anon-r-rand-mt
   4519503           +0.4%    4537293       brickland2/micro/vm-scalability=
/300s-anon-r-rand
  37310812           -0.0%   37306009       brickland2/micro/vm-scalability=
/300s-anon-r-seq-mt
  37305798           +0.1%   37342352       brickland2/micro/vm-scalability=
/300s-anon-r-seq
   4837858           -0.4%    4818819       brickland2/micro/vm-scalability=
/300s-anon-rx-rand-mt
  37378317           -0.1%   37332159       brickland2/micro/vm-scalability=
/300s-anon-rx-seq-mt
   1616595           -0.2%    1614152       brickland2/micro/vm-scalability=
/300s-anon-w-rand-64G
   1529385           +1.9%    1558620       brickland2/micro/vm-scalability=
/300s-anon-w-rand-mt-64G
  13163324           -0.4%   13113178       brickland2/micro/vm-scalability=
/300s-anon-w-seq-1T
  13465204           -2.8%   13086711       brickland2/micro/vm-scalability=
/300s-anon-w-seq-mt-64G
   1609316           -1.3%    1589081       brickland2/micro/vm-scalability=
/300s-anon-wx-rand-mt-64G
  30601798           -3.0%   29669208       brickland2/micro/vm-scalability=
/300s-anon-wx-seq-mt-1T
   1731634           +0.3%    1736152       brickland2/micro/vm-scalability=
/300s-lru-file-mmap-read-rand
   2851242           -1.1%    2820439       brickland2/micro/vm-scalability=
/300s-lru-file-mmap-read
   1894691           +1.6%    1925664       brickland2/micro/vm-scalability=
/300s-lru-file-readonce
   4415561           -4.2%    4230370       brickland2/micro/vm-scalability=
/300s-lru-file-readtwice
  22798613           -0.9%   22582261       brickland2/micro/vm-scalability=
/300s-lru-shm-128G
   1092065           +0.2%    1094507       brickland2/micro/vm-scalability=
/300s-lru-shm-rand-64G
    254980           -1.1%     252127       brickland2/micro/vm-scalability=
/300s-migrate
   1547791           +3.9%    1608126       brickland2/micro/vm-scalability=
/300s-mmap-pread-rand-mt
   2121742           -0.2%    2116905       brickland2/micro/vm-scalability=
/300s-mmap-pread-rand
   7241074           +0.4%    7270910       brickland2/micro/vm-scalability=
/300s-mmap-pread-seq-mt
  27696386           +0.9%   27936027       brickland2/micro/vm-scalability=
/300s-mmap-pread-seq
   1732560           +1.4%    1756680       brickland2/micro/vm-scalability=
/300s-mmap-xread-rand-mt
   4498840           +2.6%    4616880       brickland2/micro/vm-scalability=
/300s-mmap-xread-seq-mt
 3.561e+08           -3.5%  3.437e+08       brickland2/micro/vm-scalability=
/300s-mremap-xread-rand-mt
    347640           +5.5%     366720       brickland2/micro/vm-scalability=
/300s-msync-mt-64G
   3398612          -10.8%    3031038       brickland2/micro/vm-scalability=
/300s-remap-128G
   3351726           -0.1%    3349728       brickland2/micro/vm-scalability=
/300s-shm-pread-rand-16G
   3272976           +0.6%    3293600       brickland2/micro/vm-scalability=
/300s-shm-pread-rand-mt-16G
  17009985           -7.3%   15762893       brickland2/micro/vm-scalability=
/300s-shm-pread-seq-1T
   8828753           -1.7%    8679346       brickland2/micro/vm-scalability=
/300s-shm-pread-seq-mt-1T
   3352928           -0.3%    3343020       brickland2/micro/vm-scalability=
/300s-shm-xread-rand-16G
   3294798           -2.2%    3222891       brickland2/micro/vm-scalability=
/300s-shm-xread-rand-mt-16G
  17405983           -9.7%   15725596       brickland2/micro/vm-scalability=
/300s-shm-xread-seq-1T
  11476856           -1.7%   11278917       brickland2/micro/vm-scalability=
/300s-shm-xread-seq-mt-1T
    134735           +0.8%     135840       brickland2/micro/vm-scalability=
/300s-small-allocs-mt
   2078739           -2.7%    2022028       brickland2/micro/vm-scalability=
/300s-small-allocs
 7.301e+08           -2.2%  7.138e+08       TOTAL vm-scalability.throughput

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     14.94           +0.0%      14.94       brickland1/micro/pigz/100%
     14.89           +0.1%      14.90       brickland1/micro/pigz/25%
     14.91           +0.0%      14.91       brickland1/micro/will-it-scale/=
brk1
     14.70           -1.0%      14.56       brickland1/micro/will-it-scale/=
context_switch1
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
eventfd1
     14.89           +0.1%      14.90       brickland1/micro/will-it-scale/=
futex1
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
futex2
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
futex3
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
futex4
     14.89           +0.1%      14.90       brickland1/micro/will-it-scale/=
getppid1
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
lock1
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
lseek1
     14.89           +0.1%      14.90       brickland1/micro/will-it-scale/=
lseek2
     14.91           +0.0%      14.91       brickland1/micro/will-it-scale/=
malloc1
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
malloc2
     14.91           +0.0%      14.91       brickland1/micro/will-it-scale/=
mmap1
     14.91           +0.0%      14.91       brickland1/micro/will-it-scale/=
mmap2
     14.91           -0.1%      14.90       brickland1/micro/will-it-scale/=
open1
     14.92           +0.0%      14.92       brickland1/micro/will-it-scale/=
open2
     28.76           +0.2%      28.82       brickland1/micro/will-it-scale/=
page_fault1
     19.56           -1.0%      19.37       brickland1/micro/will-it-scale/=
page_fault2
     14.93           +0.0%      14.93       brickland1/micro/will-it-scale/=
page_fault3
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
pipe1
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
poll1
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
poll2
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
posix_semaphore1
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
pread1
     14.93           +0.0%      14.93       brickland1/micro/will-it-scale/=
pread2
     14.89           +0.1%      14.90       brickland1/micro/will-it-scale/=
pthread_mutex1
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
pthread_mutex2
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
pwrite1
     14.90           +0.0%      14.90       brickland1/micro/will-it-scale/=
pwrite2
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
read1
     14.92           +0.0%      14.92       brickland1/micro/will-it-scale/=
read2
     14.89           +0.1%      14.90       brickland1/micro/will-it-scale/=
readseek
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
sched_yield
     14.90           +0.0%      14.90       brickland1/micro/will-it-scale/=
signal1
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
unix1
     14.92           +0.0%      14.92       brickland1/micro/will-it-scale/=
unlink1
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
unlink2
     14.89           +0.0%      14.89       brickland1/micro/will-it-scale/=
write1
     14.90           -0.1%      14.89       brickland1/micro/will-it-scale/=
writeseek
      8.74           +0.0%       8.74       brickland2/micro/aim7/brk_test
     10.13           +6.2%      10.76       brickland2/micro/aim7/compute
      8.77           +0.0%       8.77       brickland2/micro/aim7/creat-clo
     17.84           -0.1%      17.83       brickland2/micro/aim7/dbase
      8.79           +0.0%       8.79       brickland2/micro/aim7/disk_src
      8.79           +0.0%       8.79       brickland2/micro/aim7/exec_test
      8.80           +0.0%       8.80       brickland2/micro/aim7/fork_test
      8.79           +0.0%       8.79       brickland2/micro/aim7/link_test
      8.79           +0.0%       8.79       brickland2/micro/aim7/misc_rtns=
_1
      8.79           +0.0%       8.79       brickland2/micro/aim7/shared
      8.79           +0.0%       8.79       brickland2/micro/aim7/shell_rtn=
s_1
      8.75           +0.1%       8.76       brickland2/micro/aim7/signal_te=
st
      8.76           +0.0%       8.76       brickland2/micro/aim7/sort_rtns=
_1
      8.76           +0.0%       8.76       brickland2/micro/aim7/string_rt=
ns
      8.76           +0.1%       8.77       brickland2/micro/aim7/trig_rtns
      8.77           +0.0%       8.77       brickland2/micro/hackbench/600%=
-process-pipe
      8.94           -1.9%       8.77       brickland2/micro/hackbench/600%=
-threads-pipe
      8.76           +0.0%       8.76       brickland2/micro/kbuild/200%-1H=
DD-ext4
      8.76           +0.0%       8.76       brickland2/micro/kbuild/200%
      8.78           +0.0%       8.78       brickland2/micro/kbuild/50%-1HD=
D-ext4
      8.78           +0.0%       8.78       brickland2/micro/kbuild/50%
     14.44           -0.3%      14.39       brickland2/micro/vm-scalability=
/300s-anon-cow-rand-64G
     10.04           +1.8%      10.22       brickland2/micro/vm-scalability=
/300s-anon-cow-rand-mt-64G
     18.69           +1.6%      18.99       brickland2/micro/vm-scalability=
/300s-anon-cow-seq-1T
     13.27           -1.1%      13.12       brickland2/micro/vm-scalability=
/300s-anon-cow-seq-mt-1T
      8.75           +0.1%       8.76       brickland2/micro/vm-scalability=
/300s-anon-r-rand-mt
      8.76           +0.0%       8.76       brickland2/micro/vm-scalability=
/300s-anon-r-rand
      8.75           -0.1%       8.74       brickland2/micro/vm-scalability=
/300s-anon-r-seq-mt
      8.75           +0.0%       8.75       brickland2/micro/vm-scalability=
/300s-anon-r-seq
      8.76           +0.0%       8.76       brickland2/micro/vm-scalability=
/300s-anon-rx-rand-mt
      8.75           -0.1%       8.74       brickland2/micro/vm-scalability=
/300s-anon-rx-seq-mt
     14.35           -0.4%      14.29       brickland2/micro/vm-scalability=
/300s-anon-w-rand-64G
     14.51           -4.5%      13.85       brickland2/micro/vm-scalability=
/300s-anon-w-rand-mt-64G
     18.81           -0.3%      18.76       brickland2/micro/vm-scalability=
/300s-anon-w-seq-1T
     14.74           +1.5%      14.96       brickland2/micro/vm-scalability=
/300s-anon-w-seq-mt-64G
      8.83           -0.8%       8.76       brickland2/micro/vm-scalability=
/300s-anon-wx-rand-mt-64G
     14.34           +2.4%      14.69       brickland2/micro/vm-scalability=
/300s-anon-wx-seq-mt-1T
      8.85           +0.0%       8.85       brickland2/micro/vm-scalability=
/300s-lru-file-mmap-read-rand
      8.76           +0.0%       8.76       brickland2/micro/vm-scalability=
/300s-lru-file-mmap-read
      8.82           -0.1%       8.81       brickland2/micro/vm-scalability=
/300s-lru-file-readonce
      8.88           +0.1%       8.89       brickland2/micro/vm-scalability=
/300s-lru-file-readtwice
      8.77           +0.0%       8.77       brickland2/micro/vm-scalability=
/300s-lru-shm-128G
      8.82           +0.3%       8.85       brickland2/micro/vm-scalability=
/300s-lru-shm-rand-64G
      8.77           +0.0%       8.77       brickland2/micro/vm-scalability=
/300s-migrate
      8.76           +0.0%       8.76       brickland2/micro/vm-scalability=
/300s-mmap-pread-rand-mt
      8.75           +0.0%       8.75       brickland2/micro/vm-scalability=
/300s-mmap-pread-rand
      8.76           +0.0%       8.76       brickland2/micro/vm-scalability=
/300s-mmap-pread-seq-mt
      8.92           +1.0%       9.01       brickland2/micro/vm-scalability=
/300s-mmap-pread-seq
      8.76           +0.0%       8.76       brickland2/micro/vm-scalability=
/300s-mmap-xread-rand-mt
      8.79           +0.0%       8.79       brickland2/micro/vm-scalability=
/300s-mmap-xread-seq-mt
      8.90           -1.0%       8.81       brickland2/micro/vm-scalability=
/300s-mremap-xread-rand-mt
      8.80           -0.1%       8.79       brickland2/micro/vm-scalability=
/300s-msync-mt-64G
      8.79           +0.0%       8.79       brickland2/micro/vm-scalability=
/300s-remap-128G
      8.75           +0.0%       8.75       brickland2/micro/vm-scalability=
/300s-shm-pread-rand-16G
      8.77           +0.0%       8.77       brickland2/micro/vm-scalability=
/300s-shm-pread-rand-mt-16G
      8.85           +0.0%       8.85       brickland2/micro/vm-scalability=
/300s-shm-pread-seq-1T
      8.76           +0.0%       8.76       brickland2/micro/vm-scalability=
/300s-shm-pread-seq-mt-1T
      8.75           +0.0%       8.75       brickland2/micro/vm-scalability=
/300s-shm-xread-rand-16G
      8.79           +0.0%       8.79       brickland2/micro/vm-scalability=
/300s-shm-xread-rand-mt-16G
      8.84           +0.1%       8.85       brickland2/micro/vm-scalability=
/300s-shm-xread-seq-1T
      8.79           +0.0%       8.79       brickland2/micro/vm-scalability=
/300s-shm-xread-seq-mt-1T
      8.78           +0.0%       8.78       brickland2/micro/vm-scalability=
/300s-small-allocs-mt
      8.80           +0.0%       8.80       brickland2/micro/vm-scalability=
/300s-small-allocs
      8.77           +0.0%       8.77       brickland2/micro/vm-scalability=
/300s-truncate-16G
     12.40           -4.1%      11.89       grantley/micro/aim7/brk_test
     14.54           -4.9%      13.83       grantley/micro/aim7/compute
      8.56           -7.6%       7.91       grantley/micro/aim7/creat-clo
     19.40           +6.2%      20.60       grantley/micro/aim7/dbase
      7.95          +15.2%       9.16       grantley/micro/aim7/disk_src
     12.95           -7.8%      11.94       grantley/micro/aim7/exec_test
     16.07           -3.2%      15.55       grantley/micro/aim7/fork_test
      7.37           -3.0%       7.15       grantley/micro/aim7/link_test
      7.50           -6.5%       7.01       grantley/micro/aim7/mem_rtns_1
      6.23           +2.6%       6.39       grantley/micro/aim7/misc_rtns_1
     11.86           +4.6%      12.41       grantley/micro/aim7/shared
     13.99           -2.4%      13.66       grantley/micro/aim7/shell_rtns_1
     10.32           -0.2%      10.30       grantley/micro/aim7/signal_test
      7.01           -8.4%       6.42       grantley/micro/aim7/sort_rtns_1
      8.47           +2.4%       8.67       grantley/micro/aim7/string_rtns
      8.12           +2.0%       8.28       grantley/micro/aim7/trig_rtns
     14.92           -4.0%      14.33       grantley/micro/kbuild/200%-1HDD=
-ext4
     15.74           -1.5%      15.51       grantley/micro/kbuild/200%
     11.68           +6.6%      12.45       grantley/micro/kbuild/50%-1HDD-=
ext4
     12.00           -1.2%      11.86       grantley/micro/kbuild/50%
     11.27           -8.8%      10.28       grantley/micro/pigz/100%
      8.21          +11.8%       9.18       grantley/micro/pigz/25%
   1517.66           -0.1%    1516.06       TOTAL turbostat.RAM_W

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     51915          -11.4%      45978       brickland2/micro/hackbench/600%=
-process-pipe
     51179          +11.7%      57149       brickland2/micro/hackbench/600%=
-threads-pipe
    181392           -9.3%     164557       lkp-nex05/micro/hackbench/800%-=
process-pipe
    133692           +0.0%     133733       lkp-nex05/micro/hackbench/800%-=
process-socket
    149271           -2.0%     146293       lkp-nex05/micro/hackbench/800%-=
threads-pipe
    135943           +2.7%     139559       lkp-nex05/micro/hackbench/800%-=
threads-socket
    130355           +1.0%     131680       lkp-ws02/micro/hackbench/1600%-=
process-pipe
    128574           -2.2%     125723       lkp-ws02/micro/hackbench/1600%-=
threads-pipe
     97346           +1.9%      99179       lkp-ws02/micro/hackbench/1600%-=
threads-socket
    303789           -9.5%     274893       lkp-wsx02/micro/hackbench/1600%=
-process-pipe
    259790           +1.9%     264834       lkp-wsx02/micro/hackbench/1600%=
-threads-pipe
    111774           -4.4%     106818       nhm8/micro/hackbench/1600%-proc=
ess-pipe
     61969           +0.3%      62183       nhm8/micro/hackbench/1600%-proc=
ess-socket
    109582           -3.7%     105523       nhm8/micro/hackbench/1600%-thre=
ads-pipe
     61038           +0.0%      61044       nhm8/micro/hackbench/1600%-thre=
ads-socket
   1967617           -2.5%    1919154       TOTAL hackbench.throughput

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     12036           +0.2%      12062       brickland2/micro/aim7/brk_test
    148839           -0.8%     147606       brickland2/micro/aim7/compute
     13860           -1.5%      13654       brickland2/micro/aim7/creat-clo
    119061           +1.0%     120218       brickland2/micro/aim7/dbase
    101712           -2.0%      99709       brickland2/micro/aim7/disk_src
     55045           +2.0%      56156       brickland2/micro/aim7/exec_test
      3310           -0.5%       3295       brickland2/micro/aim7/fork_test
     40295           +2.6%      41332       brickland2/micro/aim7/link_test
    140383           +4.1%     146074       brickland2/micro/aim7/misc_rtns=
_1
     79113           -1.7%      77734       brickland2/micro/aim7/shared
     47153           -1.2%      46567       brickland2/micro/aim7/shell_rtn=
s_1
     98879           -3.7%      95245       brickland2/micro/aim7/signal_te=
st
    231749           -0.5%     230503       brickland2/micro/aim7/sort_rtns=
_1
    150056           +0.1%     150131       brickland2/micro/aim7/string_rt=
ns
    130165           +2.5%     133466       brickland2/micro/aim7/trig_rtns
     90191           -0.0%      90184       grantley/micro/aim7/brk_test
    346483           +0.7%     348776       grantley/micro/aim7/compute
     30122           +2.4%      30842       grantley/micro/aim7/creat-clo
    238986          -10.4%     214208       grantley/micro/aim7/dbase
    342368           -3.5%     330396       grantley/micro/aim7/disk_src
    113927           -1.4%     112317       grantley/micro/aim7/exec_test
     11240           +1.8%      11438       grantley/micro/aim7/fork_test
    103761           -5.5%      98039       grantley/micro/aim7/link_test
    493421           -0.8%     489396       grantley/micro/aim7/mem_rtns_1
    390497           +0.5%     392413       grantley/micro/aim7/misc_rtns_1
    348086           +0.4%     349549       grantley/micro/aim7/shared
    179051           -2.9%     173938       grantley/micro/aim7/shell_rtns_1
    203527           -0.9%     201714       grantley/micro/aim7/signal_test
    494641           +0.3%     496072       grantley/micro/aim7/sort_rtns_1
    380589           +0.2%     381315       grantley/micro/aim7/string_rtns
    352630           -0.2%     351802       grantley/micro/aim7/trig_rtns
    122149           -1.6%     120192       lkp-ne04/micro/aim7/brk_test
    123673           +0.1%     123774       lkp-ne04/micro/aim7/compute
     91975           +4.1%      95731       lkp-ne04/micro/aim7/creat-clo
    533096           +1.5%     541271       lkp-ne04/micro/aim7/disk_src
    135669           +0.8%     136783       lkp-ne04/micro/aim7/exec_test
     20266           +0.7%      20398       lkp-ne04/micro/aim7/fork_test
    176860           +1.1%     178784       lkp-ne04/micro/aim7/link_test
    199800           -0.1%     199667       lkp-ne04/micro/aim7/mem_rtns_1
    667779           -0.6%     663716       lkp-ne04/micro/aim7/misc_rtns_1
    154004           +0.6%     154858       lkp-ne04/micro/aim7/shell_rtns_1
    338696           -0.9%     335664       lkp-ne04/micro/aim7/signal_test
    179506          +14.0%     204638       lkp-ne04/micro/aim7/sort_rtns_1
    108725           -4.0%     104429       lkp-ne04/micro/aim7/string_rtns
    145772           -0.3%     145278       lkp-ne04/micro/aim7/trig_rtns
     32622           +0.6%      32814       lkp-wsx01/micro/aim7/brk_test
    412104           -0.2%     411405       lkp-wsx01/micro/aim7/compute
     33891          +11.1%      37647       lkp-wsx01/micro/aim7/creat-clo
    335664           -1.2%     331491       lkp-wsx01/micro/aim7/disk_src
    148111           +2.4%     151687       lkp-wsx01/micro/aim7/exec_test
      7312           -0.2%       7300       lkp-wsx01/micro/aim7/fork_test
    151975           -0.7%     150905       lkp-wsx01/micro/aim7/link_test
    526777           +0.2%     527704       lkp-wsx01/micro/aim7/mem_rtns_1
    386224           +6.1%     409696       lkp-wsx01/micro/aim7/misc_rtns_1
    172191          -10.2%     154698       lkp-wsx01/micro/aim7/shell_rtns=
_1
    197823           +1.8%     201477       lkp-wsx01/micro/aim7/signal_test
    533807           -0.1%     533096       lkp-wsx01/micro/aim7/sort_rtns_1
    316205           -1.2%     312418       lkp-wsx01/micro/aim7/string_rtns
    415512           +0.0%     415656       lkp-wsx01/micro/aim7/trig_rtns
  12159393           -0.1%   12149358       TOTAL aim7.2000.jobs-per-min

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

       475           -0.4%        473       lkp-a06/micro/dbench/100%
      8214 ~ 0%     -40.9%       4854 ~ 0%  nhm8/micro/dbench/100%
      7825           -0.2%       7807       nhm8/micro/dbench/100%
     16515          -20.5%      13135       TOTAL dbench.throughput-MB/sec

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     20.26          -42.1%      11.73       lkp-a06/micro/dbench/100%
      6.40 ~ 5%     +13.9%       7.28 ~13%  nhm8/micro/dbench/100%
     10.49          -35.8%       6.73       nhm8/micro/dbench/100%
     37.15          -30.7%      25.75       TOTAL dbench.max_latency

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

 2.197e+10           -6.0%  2.065e+10       bens/micro/iperf/300s-tcp
  2.71e+10          +13.7%   3.08e+10       xbm/micro/iperf/300s-tcp
 4.907e+10           +4.9%  5.146e+10       TOTAL iperf.tcp.receiver.bps

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

 2.197e+10           -6.0%  2.065e+10       bens/micro/iperf/300s-tcp
  2.71e+10          +13.7%   3.08e+10       xbm/micro/iperf/300s-tcp
 4.907e+10           +4.9%  5.146e+10       TOTAL iperf.tcp.sender.bps

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

   1048360           +0.0%    1048360       bens/micro/iperf/300s-udp
   1048360           +0.0%    1048360       xbm/micro/iperf/300s-udp
   2096720           +0.0%    2096720       TOTAL iperf.udp.bps

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

   4394346           -2.3%    4294100       vpx/micro/iozone/2HDD-ext4-cfq
   4977796           +9.6%    5454339       vpx/micro/iozone/2HDD-xfs-cfq
   9372142           +4.0%    9748440       TOTAL iozone.average_KBps

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

    114.67           +1.1%     115.89       brickland1/micro/pigz/100%
    172.79           -1.7%     169.87       brickland1/micro/pigz/25%
    474.64           +0.5%     477.05       grantley/micro/pigz/100%
    176.46           -1.1%     174.56       grantley/micro/pigz/25%
     66.92           -3.4%      64.66       kbuildx/micro/pigz/100%
    401.98           -1.4%     396.46       lkp-nex04/micro/pigz/100%
    403.56           -2.1%     395.08       lkp-nex06/micro/pigz/100%
    103.23           -0.5%     102.74       lkp-wsx01/micro/pigz/100%
     45.60           +0.1%      45.66       xbm/micro/pigz/100%
     18.02           +0.2%      18.06       xbm/micro/pigz/25%
   1977.89           -0.9%    1960.04       TOTAL pigz.throughput

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     20121           -1.9%      19735       bay/micro/nuttcp/300s
     22776           +0.8%      22966       xbm/micro/nuttcp/300s
     42897           -0.5%      42701       TOTAL nuttcp.throughput_Mbps

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     22138           +5.5%      23360       bay/micro/thrulay/300s
     16321           +4.0%      16978       xbm/micro/thrulay/300s
     38460           +4.9%      40338       TOTAL thrulay.throughput

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      0.04           -9.8%       0.04       bay/micro/thrulay/300s
      0.04         +113.3%       0.10       xbm/micro/thrulay/300s
      0.09          +54.7%       0.13       TOTAL thrulay.jitter

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      0.21           -3.8%       0.20       bay/micro/thrulay/300s
      0.33           -6.4%       0.30       xbm/micro/thrulay/300s
      0.54           -5.4%       0.51       TOTAL thrulay.RTT

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     14778           +0.1%      14792       bens/micro/ebizzy/200%-100-10
     31699           +0.1%      31738       nhm4/micro/ebizzy/200%-100-10
     46477           +0.1%      46530       TOTAL ebizzy.throughput

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      1162           -4.6%       1108       kbuildx/micro/tbench/100%
       184           -1.3%        182       lkp-a06/micro/tbench/100%
      2965           -2.4%       2894       nhm8/micro/tbench/100%
      4312           -2.9%       4185       TOTAL tbench.throughput-MB/sec

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      3.26          -20.2%       2.60       kbuildx/micro/tbench/100%
      6.07          +10.9%       6.73       lkp-a06/micro/tbench/100%
      1.70          +11.5%       1.89       nhm8/micro/tbench/100%
     11.03           +1.8%      11.22       TOTAL tbench.max_latency

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

   1782540          +11.6%    1989073       bay/micro/nepim/300s-100%-tcp
   2111859           +0.1%    2113028       bay/micro/nepim/300s-100%-tcp6
    156101           -1.9%     153103       lkp-nex06/micro/nepim/300s-100%=
-tcp
    144341           -3.4%     139505       lkp-nex06/micro/nepim/300s-100%=
-tcp6
   4194843           +4.8%    4394710       TOTAL nepim.tcp.avg.kbps_in

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

   1782606          +11.6%    1989295       bay/micro/nepim/300s-100%-tcp
   2112067           +0.1%    2113262       bay/micro/nepim/300s-100%-tcp6
    156251           -2.0%     153103       lkp-nex06/micro/nepim/300s-100%=
-tcp
    144341           -3.4%     139505       lkp-nex06/micro/nepim/300s-100%=
-tcp6
   4195266           +4.8%    4395167       TOTAL nepim.tcp.avg.kbps_out

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      1.51          +20.5%       1.82       kbuildx/sysbench/oltp/600s-100%=
-1000000
      1.51          +20.5%       1.82       TOTAL oltp.request_latency_95%_=
ms

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     11.96           +2.8%      12.30       nhm4/micro/fsmark/400%-1HDD-xfs=
-10485760-16-256-45
     11.96           +2.8%      12.30       TOTAL fsmark.files_per_sec

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

 1.943e+08          +45.7%   2.83e+08       bens/micro/qperf/600s
  89990431           -9.7%   81257759       lkp-a06/micro/qperf/600s
 6.744e+08           -1.9%  6.614e+08       nhm8/micro/qperf/600s
 9.586e+08           +7.0%  1.026e+09       TOTAL qperf.sctp.bw

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

 2.645e+09           +7.3%  2.838e+09       bens/micro/qperf/600s
 6.347e+08           +3.0%  6.538e+08       lkp-a06/micro/qperf/600s
 6.442e+09           +2.9%  6.627e+09       nhm8/micro/qperf/600s
 9.723e+09           +4.1%  1.012e+10       TOTAL qperf.tcp.bw

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

 2.038e+09           +0.2%  2.042e+09       bens/micro/qperf/600s
 6.528e+08           -1.0%  6.462e+08       lkp-a06/micro/qperf/600s
 4.818e+09           -1.2%   4.76e+09       nhm8/micro/qperf/600s
 7.508e+09           -0.8%  7.448e+09       TOTAL qperf.udp.recv_bw

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

  2.05e+09           +0.5%   2.06e+09       bens/micro/qperf/600s
 6.621e+08           -1.1%  6.551e+08       lkp-a06/micro/qperf/600s
  4.82e+09           -1.2%  4.762e+09       nhm8/micro/qperf/600s
 7.531e+09           -0.7%  7.477e+09       TOTAL qperf.udp.send_bw

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     14668           -1.5%      14447       bens/micro/qperf/600s
     78612           -3.2%      76133       lkp-a06/micro/qperf/600s
     11204           -4.3%      10721       nhm8/micro/qperf/600s
    104484           -3.0%     101301       TOTAL qperf.sctp.latency

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

     10169           +1.6%      10331       bens/micro/qperf/600s
     51752           -1.9%      50777       lkp-a06/micro/qperf/600s
      9115           -4.7%       8683       nhm8/micro/qperf/600s
     71036           -1.8%      69791       TOTAL qperf.tcp.latency

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      8656           +0.7%       8720       bens/micro/qperf/600s
     43290           -1.7%      42552       lkp-a06/micro/qperf/600s
      6890           +0.5%       6926       nhm8/micro/qperf/600s
     58836           -1.1%      58198       TOTAL qperf.udp.latency

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

    785568           -6.4%     735070       bay/micro/nepim/300s-100%-udp
    684129           +9.5%     749016       bay/micro/nepim/300s-100%-udp6
     67299          -18.0%      55192       lkp-nex06/micro/nepim/300s-100%=
-udp
     44340          +23.8%      54883       lkp-nex06/micro/nepim/300s-100%=
-udp6
   1581337           +0.8%    1594163       TOTAL nepim.udp.avg.kbps_in

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

    837038           -3.5%     807398       bay/micro/nepim/300s-100%-udp
    684258           +9.5%     749072       bay/micro/nepim/300s-100%-udp6
     81934          -20.7%      64934       lkp-nex06/micro/nepim/300s-100%=
-udp
     45164          +34.2%      60604       lkp-nex06/micro/nepim/300s-100%=
-udp6
   1648394           +2.0%    1682010       TOTAL nepim.udp.avg.kbps_out


--===============4895310395005538128==--

