Content-Type: multipart/mixed; boundary="===============1610212805264901861=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] 177672afd93: -40.9% dbench.throughput-MB/sec
Date: Tue, 08 Apr 2014 10:08:50 +0800
Message-ID: <20140408020850.GC8796@localhost>
In-Reply-To: <20140405141642.GB13106@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1610212805264901861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tim,

Here are the test summary.

% compare -ia wfg/tim-idle-load-balance
    98      perf-index  wfg/tim-idle-load-balance
   124     power-index  wfg/tim-idle-load-balance
    94   latency-index  wfg/tim-idle-load-balance

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
     85.38           +0.2%      85.51       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-rndrd-sync
     72.32          -11.1%      64.29       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-rndrw-sync
      0.10          -30.0%       0.07       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-rndwr-sync
      1.07          -16.8%       0.89       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-seqrd-sync
      0.09          +55.6%       0.14       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-seqrewr-sync
      0.13           +0.0%       0.13       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-ext4-64G-1024-seqwr-sync
     95.90          -15.3%      81.25       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-rndrd-sync
     94.65          -24.1%      71.80       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-rndrw-sync
      0.09          -22.2%       0.07       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-rndwr-sync
      0.97          -17.5%       0.80       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-seqrd-sync
      0.10          -10.0%       0.09       kbuildx/sysbench/fileio/600s-10=
0%-1HDD-xfs-64G-1024-seqwr-sync
     45.06           +1.5%      45.72       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrd-sync
     43.70           +0.1%      43.75       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrw-sync
      0.03           +0.0%       0.03       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndwr-sync
      2.57           -0.4%       2.56       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrd-sync
      0.02         +100.0%       0.04       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrewr-sync
      0.03          +66.7%       0.05       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqwr-sync
     49.21           +0.4%      49.39       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrd-sync
     52.78           +1.1%      53.34       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrw-sync
      0.01         +100.0%       0.02       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndwr-sync
      2.58           -0.4%       2.57       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrd-sync
      0.02 ~ 0%     +50.0%       0.03       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrewr-sync
      0.02 ~ 0%    +100.0%       0.04       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqwr-sync
    546.83           -8.1%     502.58       TOTAL fileio.request_latency_95=
%_ms

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
   3081836          +31.0%    4037172       kbuildx/micro/will-it-scale/brk1
    579081          -27.4%     420172       kbuildx/micro/will-it-scale/con=
text_switch1
   2677858           +8.7%    2911814       kbuildx/micro/will-it-scale/eve=
ntfd1
   4997685           -6.8%    4658574       kbuildx/micro/will-it-scale/fut=
ex1
   4820209          -16.4%    4029473       kbuildx/micro/will-it-scale/fut=
ex2
   9175395          +42.3%   13060407       kbuildx/micro/will-it-scale/fut=
ex3
   8687050           -9.7%    7841336       kbuildx/micro/will-it-scale/fut=
ex4
  19857489           -2.2%   19424336       kbuildx/micro/will-it-scale/get=
ppid1
   3202049           +1.2%    3241283       kbuildx/micro/will-it-scale/loc=
k1
  14974024          +13.0%   16917603       kbuildx/micro/will-it-scale/lse=
ek1
  15898842           -6.0%   14940232       kbuildx/micro/will-it-scale/lse=
ek2
    182873           +0.9%     184579       kbuildx/micro/will-it-scale/mal=
loc1
  29201757           -5.4%   27615173       kbuildx/micro/will-it-scale/mal=
loc2
    606390          +24.5%     755057       kbuildx/micro/will-it-scale/mma=
p1
    717868           -4.2%     687408       kbuildx/micro/will-it-scale/mma=
p2
    576186          +39.0%     800981       kbuildx/micro/will-it-scale/ope=
n1
    685080          -31.8%     467132       kbuildx/micro/will-it-scale/ope=
n2
   1433105          -17.0%    1189039       kbuildx/micro/will-it-scale/pag=
e_fault1
    353697           +4.8%     370642       kbuildx/micro/will-it-scale/pag=
e_fault2
   1012142           +1.0%    1021800       kbuildx/micro/will-it-scale/pag=
e_fault3
   2019546           -5.6%    1907225       kbuildx/micro/will-it-scale/pip=
e1
  12270196           -3.0%   11907480       kbuildx/micro/will-it-scale/pol=
l1
    667919          -15.1%     567346       kbuildx/micro/will-it-scale/pol=
l2
  40532111           -2.7%   39430596       kbuildx/micro/will-it-scale/pos=
ix_semaphore1
   2626698          -40.2%    1570040       kbuildx/micro/will-it-scale/pre=
ad1
   1289351          -32.3%     872712       kbuildx/micro/will-it-scale/pre=
ad2
 2.079e+08           -6.2%  1.949e+08       kbuildx/micro/will-it-scale/pth=
read_mutex1
 2.325e+08           -2.9%  2.258e+08       kbuildx/micro/will-it-scale/pth=
read_mutex2
    862265           -0.6%     856735       kbuildx/micro/will-it-scale/pwr=
ite2
   1624163           +8.7%    1764808       kbuildx/micro/will-it-scale/rea=
d1
   1912821           -8.9%    1742796       kbuildx/micro/will-it-scale/rea=
d2
   1994084          +14.8%    2288540       kbuildx/micro/will-it-scale/rea=
dseek
   3395276          +18.1%    4011241       kbuildx/micro/will-it-scale/sch=
ed_yield
    806280          +20.0%     967611       kbuildx/micro/will-it-scale/sig=
nal1
   1152264          -44.6%     638204       kbuildx/micro/will-it-scale/uni=
x1
    119564          -61.2%      46401       kbuildx/micro/will-it-scale/unl=
ink1
    130399           -8.1%     119824       kbuildx/micro/will-it-scale/unl=
ink2
   1093555          +11.3%    1216816       kbuildx/micro/will-it-scale/wri=
te1
   1109424          -16.4%     927781       kbuildx/micro/will-it-scale/wri=
teseek
    498136           +1.7%     506398       lkp-a03/micro/will-it-scale/brk1
     60368           -1.0%      59758       lkp-a03/micro/will-it-scale/con=
text_switch1
    546167           -2.4%     532971       lkp-a03/micro/will-it-scale/eve=
ntfd1
   1188127          +11.3%    1322807       lkp-a03/micro/will-it-scale/fut=
ex1
   1049210           -0.8%    1041086       lkp-a03/micro/will-it-scale/fut=
ex2
   2554426           +6.4%    2719162       lkp-a03/micro/will-it-scale/fut=
ex3
   2055294           -3.6%    1982080       lkp-a03/micro/will-it-scale/fut=
ex4
   4648715           +1.1%    4701250       lkp-a03/micro/will-it-scale/get=
ppid1
    407376           +1.4%     413147       lkp-a03/micro/will-it-scale/loc=
k1
   3632575          -11.4%    3220162       lkp-a03/micro/will-it-scale/lse=
ek1
   3640279           -8.7%    3323511       lkp-a03/micro/will-it-scale/lse=
ek2
     35692           -0.4%      35556       lkp-a03/micro/will-it-scale/mal=
loc1
   4013513           +0.1%    4016965       lkp-a03/micro/will-it-scale/mal=
loc2
    123417           -3.2%     119459       lkp-a03/micro/will-it-scale/mma=
p1
    104039           -2.7%     101178       lkp-a03/micro/will-it-scale/mma=
p2
    111741           -1.1%     110490       lkp-a03/micro/will-it-scale/ope=
n1
    106721           -3.7%     102749       lkp-a03/micro/will-it-scale/ope=
n2
    176734           -0.2%     176416       lkp-a03/micro/will-it-scale/pag=
e_fault1
     78942           +0.3%      79155       lkp-a03/micro/will-it-scale/pag=
e_fault2
    328452           +2.4%     336252       lkp-a03/micro/will-it-scale/pag=
e_fault3
    300951           -3.4%     290822       lkp-a03/micro/will-it-scale/pip=
e1
   1947407           -3.0%    1889571       lkp-a03/micro/will-it-scale/pol=
l1
     94646           -4.1%      90743       lkp-a03/micro/will-it-scale/pol=
l2
  12867597           -0.6%   12796431       lkp-a03/micro/will-it-scale/pos=
ix_semaphore1
    438853           -1.8%     430800       lkp-a03/micro/will-it-scale/pre=
ad1
    361487           +3.0%     372426       lkp-a03/micro/will-it-scale/pre=
ad2
  19178035           -0.0%   19175900       lkp-a03/micro/will-it-scale/pth=
read_mutex1
  19708674           +0.8%   19869328       lkp-a03/micro/will-it-scale/pth=
read_mutex2
    318874           +1.5%     323607       lkp-a03/micro/will-it-scale/pwr=
ite1
    157182           +7.1%     168264       lkp-a03/micro/will-it-scale/pwr=
ite2
    213621           -0.5%     212548       lkp-a03/micro/will-it-scale/rea=
d1
    216775           -9.3%     196697       lkp-a03/micro/will-it-scale/rea=
d2
 7.179e+08           -2.9%  6.968e+08       TOTAL will-it-scale.per_process=
_ops

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
    948797          +26.1%    1196716       kbuildx/micro/will-it-scale/brk1
    661343          -28.2%     474896       kbuildx/micro/will-it-scale/con=
text_switch1
   2158125           +4.3%    2249953       kbuildx/micro/will-it-scale/eve=
ntfd1
   3652285           +9.8%    4010569       kbuildx/micro/will-it-scale/fut=
ex1
   3754095          -20.1%    3001278       kbuildx/micro/will-it-scale/fut=
ex2
   8788557          +48.5%   13050354       kbuildx/micro/will-it-scale/fut=
ex3
   8673483           -7.9%    7986162       kbuildx/micro/will-it-scale/fut=
ex4
  20234106           -3.7%   19482740       kbuildx/micro/will-it-scale/get=
ppid1
   2394550           -2.9%    2324504       kbuildx/micro/will-it-scale/loc=
k1
  10095004          -12.3%    8853616       kbuildx/micro/will-it-scale/lse=
ek1
  10575795          -18.4%    8630257       kbuildx/micro/will-it-scale/lse=
ek2
     78582           -3.2%      76051       kbuildx/micro/will-it-scale/mal=
loc1
  19801191           -3.7%   19059934       kbuildx/micro/will-it-scale/mal=
loc2
    343349           -8.3%     314825       kbuildx/micro/will-it-scale/mma=
p1
    307814          -10.0%     276911       kbuildx/micro/will-it-scale/mma=
p2
    624368           +6.7%     666086       kbuildx/micro/will-it-scale/ope=
n1
    655417          -30.9%     452597       kbuildx/micro/will-it-scale/ope=
n2
   1349106          -20.5%    1072202       kbuildx/micro/will-it-scale/pag=
e_fault1
    266167          +12.9%     300623       kbuildx/micro/will-it-scale/pag=
e_fault2
    777867          +18.4%     921059       kbuildx/micro/will-it-scale/pag=
e_fault3
   1694974           -6.2%    1589896       kbuildx/micro/will-it-scale/pip=
e1
   8668422           -2.4%    8462421       kbuildx/micro/will-it-scale/pol=
l1
    293735          -16.7%     244608       kbuildx/micro/will-it-scale/pol=
l2
  41949373           -2.5%   40900774       kbuildx/micro/will-it-scale/pos=
ix_semaphore1
   2483471          -44.7%    1373995       kbuildx/micro/will-it-scale/pre=
ad1
   1135715          -16.9%     943591       kbuildx/micro/will-it-scale/pre=
ad2
  15835319          -10.3%   14211477       kbuildx/micro/will-it-scale/pth=
read_mutex1
  40177023           -3.1%   38920694       kbuildx/micro/will-it-scale/pth=
read_mutex2
    821973           -0.3%     819155       kbuildx/micro/will-it-scale/pwr=
ite2
   1253787          +16.7%    1463384       kbuildx/micro/will-it-scale/rea=
d1
   1836961          -27.5%    1331083       kbuildx/micro/will-it-scale/rea=
d2
   1414293          +30.8%    1849544       kbuildx/micro/will-it-scale/rea=
dseek
   3526509          +14.1%    4023058       kbuildx/micro/will-it-scale/sch=
ed_yield
    532969          +25.2%     667522       kbuildx/micro/will-it-scale/sig=
nal1
    961817          -48.6%     494097       kbuildx/micro/will-it-scale/uni=
x1
    137380          -66.1%      46573       kbuildx/micro/will-it-scale/unl=
ink1
    136350           +3.4%     140956       kbuildx/micro/will-it-scale/unl=
ink2
   1156972          -10.1%    1040055       kbuildx/micro/will-it-scale/wri=
te1
    869136           -8.0%     799273       kbuildx/micro/will-it-scale/wri=
teseek
    158163           +1.2%     160072       lkp-a03/micro/will-it-scale/brk1
     64538           -1.7%      63460       lkp-a03/micro/will-it-scale/con=
text_switch1
    497874           +3.9%     517442       lkp-a03/micro/will-it-scale/eve=
ntfd1
   1019236           +4.9%    1068744       lkp-a03/micro/will-it-scale/fut=
ex1
    893740           +3.1%     921073       lkp-a03/micro/will-it-scale/fut=
ex2
   2574637           +5.7%    2721713       lkp-a03/micro/will-it-scale/fut=
ex3
   2062343           -4.0%    1980391       lkp-a03/micro/will-it-scale/fut=
ex4
   4709987           -0.2%    4700300       lkp-a03/micro/will-it-scale/get=
ppid1
    386629           -5.4%     365931       lkp-a03/micro/will-it-scale/loc=
k1
   2796133          -20.2%    2230663       lkp-a03/micro/will-it-scale/lse=
ek1
   2792667          -19.9%    2235883       lkp-a03/micro/will-it-scale/lse=
ek2
     11484           -0.9%      11385       lkp-a03/micro/will-it-scale/mal=
loc1
   3720961           +0.2%    3728026       lkp-a03/micro/will-it-scale/mal=
loc2
     57486           -6.2%      53937       lkp-a03/micro/will-it-scale/mma=
p1
     50497           -6.6%      47156       lkp-a03/micro/will-it-scale/mma=
p2
    107160           -1.4%     105677       lkp-a03/micro/will-it-scale/ope=
n1
    102768           -4.4%      98252       lkp-a03/micro/will-it-scale/ope=
n2
    173361           -0.2%     173029       lkp-a03/micro/will-it-scale/pag=
e_fault1
     69486           +0.2%      69658       lkp-a03/micro/will-it-scale/pag=
e_fault2
    282496           +1.3%     286097       lkp-a03/micro/will-it-scale/pag=
e_fault3
    289102           -1.8%     283850       lkp-a03/micro/will-it-scale/pip=
e1
   1648368           -1.5%    1624062       lkp-a03/micro/will-it-scale/pol=
l1
     69681          -14.6%      59513       lkp-a03/micro/will-it-scale/pol=
l2
  12941190           -0.0%   12939294       lkp-a03/micro/will-it-scale/pos=
ix_semaphore1
    433232           -2.5%     422342       lkp-a03/micro/will-it-scale/pre=
ad1
    349203           +1.4%     353918       lkp-a03/micro/will-it-scale/pre=
ad2
   4257776           +0.4%    4275753       lkp-a03/micro/will-it-scale/pth=
read_mutex1
  11883360           +0.0%   11888242       lkp-a03/micro/will-it-scale/pth=
read_mutex2
    296769           +4.3%     309658       lkp-a03/micro/will-it-scale/pwr=
ite1
    163776           -7.3%     151813       lkp-a03/micro/will-it-scale/pwr=
ite2
    230938          -18.1%     189029       lkp-a03/micro/will-it-scale/rea=
d1
    218200           -9.6%     197232       lkp-a03/micro/will-it-scale/rea=
d2
 276339421           -3.0%  267957084       TOTAL will-it-scale.per_thread_=
ops

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
      0.77          +24.8%       0.95       kbuildx/micro/will-it-scale/brk1
      0.82          -30.1%       0.57       kbuildx/micro/will-it-scale/con=
text_switch1
      0.90          -31.0%       0.62       kbuildx/micro/will-it-scale/eve=
ntfd1
      0.85          -36.7%       0.54       kbuildx/micro/will-it-scale/fut=
ex1
      0.92          +28.3%       1.18       kbuildx/micro/will-it-scale/fut=
ex2
      0.94           -1.9%       0.92       kbuildx/micro/will-it-scale/fut=
ex3
      0.97           -8.1%       0.89       kbuildx/micro/will-it-scale/fut=
ex4
      0.81          -12.5%       0.70       kbuildx/micro/will-it-scale/get=
ppid1
      1.03          -24.6%       0.78       kbuildx/micro/will-it-scale/loc=
k1
      1.00          -10.1%       0.90       kbuildx/micro/will-it-scale/lse=
ek1
      1.13          +24.8%       1.41       kbuildx/micro/will-it-scale/lse=
ek2
      0.71          -11.7%       0.63       kbuildx/micro/will-it-scale/mal=
loc1
      0.89           -0.5%       0.88       kbuildx/micro/will-it-scale/mal=
loc2
      0.49          +69.3%       0.82       kbuildx/micro/will-it-scale/mma=
p1
      0.78          +15.0%       0.90       kbuildx/micro/will-it-scale/mma=
p2
      0.36         +148.3%       0.89       kbuildx/micro/will-it-scale/ope=
n1
      0.79          -54.5%       0.36       kbuildx/micro/will-it-scale/ope=
n2
      0.63          -20.7%       0.50       kbuildx/micro/will-it-scale/pag=
e_fault1
      0.54          +22.9%       0.66       kbuildx/micro/will-it-scale/pag=
e_fault2
      0.71          -17.6%       0.59       kbuildx/micro/will-it-scale/pag=
e_fault3
      0.68          +36.8%       0.94       kbuildx/micro/will-it-scale/pip=
e1
      0.82          +11.4%       0.92       kbuildx/micro/will-it-scale/pol=
l1
      1.48          -66.2%       0.50       kbuildx/micro/will-it-scale/pol=
l2
      0.81           +1.0%       0.82       kbuildx/micro/will-it-scale/pos=
ix_semaphore1
      0.98          -27.3%       0.71       kbuildx/micro/will-it-scale/pre=
ad1
      0.17          +54.5%       0.26       kbuildx/micro/will-it-scale/pre=
ad2
      1.00          +18.1%       1.18       kbuildx/micro/will-it-scale/pth=
read_mutex1
      0.92           +1.5%       0.94       kbuildx/micro/will-it-scale/pth=
read_mutex2
      0.13           -5.2%       0.13       kbuildx/micro/will-it-scale/pwr=
ite2
      0.53          +17.4%       0.62       kbuildx/micro/will-it-scale/rea=
d1
      0.83          -34.1%       0.55       kbuildx/micro/will-it-scale/rea=
d2
      0.57          +64.8%       0.94       kbuildx/micro/will-it-scale/rea=
dseek
      0.60          +46.9%       0.89       kbuildx/micro/will-it-scale/sch=
ed_yield
      1.08          -24.8%       0.81       kbuildx/micro/will-it-scale/sig=
nal1
      0.61          +52.0%       0.93       kbuildx/micro/will-it-scale/uni=
x1
      0.21          +38.5%       0.29       kbuildx/micro/will-it-scale/unl=
ink1
      0.32          +62.3%       0.52       kbuildx/micro/will-it-scale/unl=
ink2
      0.50         +222.0%       1.61       kbuildx/micro/will-it-scale/wri=
te1
      0.44         +112.4%       0.94       kbuildx/micro/will-it-scale/wri=
teseek
      0.59           +1.2%       0.59       lkp-a03/micro/will-it-scale/brk1
      1.05           +1.0%       1.06       lkp-a03/micro/will-it-scale/con=
text_switch1
      0.54           +1.7%       0.55       lkp-a03/micro/will-it-scale/eve=
ntfd1
      0.49          +17.7%       0.57       lkp-a03/micro/will-it-scale/fut=
ex1
      0.48          +17.6%       0.56       lkp-a03/micro/will-it-scale/fut=
ex2
      0.65           +1.1%       0.65       lkp-a03/micro/will-it-scale/fut=
ex3
      0.62           +3.5%       0.65       lkp-a03/micro/will-it-scale/fut=
ex4
      0.72           +3.3%       0.75       lkp-a03/micro/will-it-scale/get=
ppid1
      0.49           -1.4%       0.49       lkp-a03/micro/will-it-scale/loc=
k1
      0.69           +7.1%       0.74       lkp-a03/micro/will-it-scale/lse=
ek1
      0.70           +0.9%       0.70       lkp-a03/micro/will-it-scale/lse=
ek2
      0.62           +2.3%       0.64       lkp-a03/micro/will-it-scale/mal=
loc1
      0.62           -0.3%       0.62       lkp-a03/micro/will-it-scale/mal=
loc2
      0.57           +0.9%       0.57       lkp-a03/micro/will-it-scale/mma=
p1
      0.56           +4.1%       0.59       lkp-a03/micro/will-it-scale/mma=
p2
      0.63           +0.8%       0.64       lkp-a03/micro/will-it-scale/ope=
n1
      0.63           -0.8%       0.62       lkp-a03/micro/will-it-scale/ope=
n2
      0.32           +0.3%       0.32       lkp-a03/micro/will-it-scale/pag=
e_fault1
      0.49           -0.6%       0.49       lkp-a03/micro/will-it-scale/pag=
e_fault2
      0.53           -3.6%       0.51       lkp-a03/micro/will-it-scale/pag=
e_fault3
      0.52           -1.9%       0.51       lkp-a03/micro/will-it-scale/pip=
e1
      0.66           +2.0%       0.67       lkp-a03/micro/will-it-scale/pol=
l1
      0.73           -4.5%       0.70       lkp-a03/micro/will-it-scale/pol=
l2
      0.84           -1.3%       0.83       lkp-a03/micro/will-it-scale/pos=
ix_semaphore1
      0.48           +2.1%       0.49       lkp-a03/micro/will-it-scale/pre=
ad1
      0.34           -7.5%       0.32       lkp-a03/micro/will-it-scale/pre=
ad2
      0.81           -0.4%       0.81       lkp-a03/micro/will-it-scale/pth=
read_mutex1
      0.82           +0.4%       0.83       lkp-a03/micro/will-it-scale/pth=
read_mutex2
      0.49           -1.4%       0.48       lkp-a03/micro/will-it-scale/pwr=
ite1
      0.13           -2.3%       0.13       lkp-a03/micro/will-it-scale/pwr=
ite2
      0.57           +0.9%       0.58       lkp-a03/micro/will-it-scale/rea=
d1
      0.51          +56.2%       0.80       lkp-a03/micro/will-it-scale/rea=
d2
     47.63           +4.2%      49.62       TOTAL will-it-scale.scalability

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
       485           -2.4%        473       lkp-a06/micro/dbench/100%
      8220 ~ 0%     -40.9%       4854 ~ 0%  nhm8/micro/dbench/100%
      7894 ~ 0%      -1.1%       7807       nhm8/micro/dbench/100%
     16599          -20.9%      13135       TOTAL dbench.throughput-MB/sec

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
     11.47           +2.2%      11.73       lkp-a06/micro/dbench/100%
      8.06 ~49%      -9.6%       7.28 ~13%  nhm8/micro/dbench/100%
     11.26 ~35%     -40.2%       6.73       nhm8/micro/dbench/100%
     30.79          -16.4%      25.75       TOTAL dbench.max_latency

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
    111600 ~ 4%      +7.7%     120192       lkp-ne04/micro/aim7/brk_test
    117829 ~ 3%      +5.0%     123774       lkp-ne04/micro/aim7/compute
    107116 ~ 1%     -10.6%      95731       lkp-ne04/micro/aim7/creat-clo
    543847 ~ 0%      -0.5%     541271       lkp-ne04/micro/aim7/disk_src
    131390 ~ 2%      +4.1%     136783       lkp-ne04/micro/aim7/exec_test
     20891 ~ 0%      -2.4%      20398       lkp-ne04/micro/aim7/fork_test
    187049 ~ 0%      -4.4%     178784       lkp-ne04/micro/aim7/link_test
    198430 ~ 0%      +0.6%     199667       lkp-ne04/micro/aim7/mem_rtns_1
    663560 ~ 0%      +0.0%     663716       lkp-ne04/micro/aim7/misc_rtns_1
    151714 ~ 0%      +2.1%     154858       lkp-ne04/micro/aim7/shell_rtns_1
    324456 ~ 2%      +3.5%     335664       lkp-ne04/micro/aim7/signal_test
    205058 ~ 0%      -0.2%     204638       lkp-ne04/micro/aim7/sort_rtns_1
    106244 ~ 0%      -1.7%     104429       lkp-ne04/micro/aim7/string_rtns
    136249 ~ 6%      +6.6%     145278       lkp-ne04/micro/aim7/trig_rtns
   3005440 ~ 1%      +0.7%    3025190       TOTAL aim7.2000.jobs-per-min

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
    114483          +43.7%     164557       lkp-nex05/micro/hackbench/800%-=
process-pipe
     96611          +38.4%     133733       lkp-nex05/micro/hackbench/800%-=
process-socket
     79522          +84.0%     146293       lkp-nex05/micro/hackbench/800%-=
threads-pipe
     62330         +123.9%     139559       lkp-nex05/micro/hackbench/800%-=
threads-socket
    135181           -2.6%     131680       lkp-ws02/micro/hackbench/1600%-=
process-pipe
    149093          -15.7%     125723       lkp-ws02/micro/hackbench/1600%-=
threads-pipe
     90124          +10.0%      99179       lkp-ws02/micro/hackbench/1600%-=
threads-socket
    727348          +29.3%     940728       TOTAL hackbench.throughput

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
       952          +16.4%       1108       kbuildx/micro/tbench/100%
       182           +0.1%        182       lkp-a06/micro/tbench/100%
      1134          +13.8%       1290       TOTAL tbench.throughput-MB/sec

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
      2.13          +21.9%       2.60       kbuildx/micro/tbench/100%
      6.29           +7.1%       6.73       lkp-a06/micro/tbench/100%
      8.42          +10.8%       9.33       TOTAL tbench.max_latency

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
     56.12          +15.2%      64.66       kbuildx/micro/pigz/100%
    399.12           -0.7%     396.46       lkp-nex04/micro/pigz/100%
    306.11          +29.1%     395.08       lkp-nex06/micro/pigz/100%
    761.36          +12.5%     856.20       TOTAL pigz.throughput

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
     24.70           -2.1%      24.18       snb-drag/crypto/tcrypt/2s-200-2=
04
     24.14           -2.3%      23.58       snb-drag/crypto/tcrypt/2s-205-2=
10
     23.80           -0.6%      23.65       snb-drag/crypto/tcrypt/2s-301-3=
19
     23.98           -0.4%      23.89       snb-drag/crypto/tcrypt/2s-401-4=
17
     25.24           -3.1%      24.46       snb-drag/crypto/tcrypt/2s-500-5=
04
     24.66           -1.6%      24.26       snb-drag/crypto/tcrypt/2s-505-5=
09
      5.64           -6.4%       5.28       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrd-sync
      6.45           -8.2%       5.92       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndrw-sync
      5.37           -3.0%       5.21       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-rndwr-sync
      7.56           -6.5%       7.07       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrd-sync
     16.74          -52.2%       8.01       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqrewr-sync
     17.18          -52.3%       8.19       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-ext4-64G-1024-seqwr-sync
      6.98          -19.6%       5.61       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrd-sync
      6.91          -17.8%       5.68       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndrw-sync
      4.82           -3.1%       4.67       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-rndwr-sync
      8.87          -16.2%       7.43       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrd-sync
     17.27 ~ 2%     -53.2%       8.09       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqrewr-sync
     16.73 ~ 4%     -51.3%       8.15       snb-drag/sysbench/fileio/600s-1=
00%-1HDD-xfs-64G-1024-seqwr-sync
    267.04          -16.4%     223.33       TOTAL turbostat.Pkg_W

          v3.13  177672afd93461854abe26c05
---------------  -------------------------
      4.26          -49.8%       2.14       lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
   4899.57           -0.4%    4882.11       lkp-t410/micro/netperf/300s-200=
%-TCP_SENDFILE
     81.77          -50.7%      40.31       lkp-t410/micro/netperf/900s-200=
%-SCTP_STREAM_MANY
   2244.16           -3.7%    2160.07       lkp-t410/micro/netperf/900s-200=
%-TCP_MAERTS
   2265.85           -3.8%    2179.04       lkp-t410/micro/netperf/900s-200=
%-TCP_STREAM
   9495.60           -2.4%    9263.66       TOTAL netperf.Throughput_Mbps

--===============1610212805264901861==--

