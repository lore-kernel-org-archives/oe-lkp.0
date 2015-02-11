Content-Type: multipart/mixed; boundary="===============9008238052646967551=="
MIME-Version: 1.0
From: pang.xunlei@zte.com.cn
To: lkp@lists.01.org
Subject: 答复: [sched/fair] 638476007d1: +1.1% unixbench.score
Date: Wed, 11 Feb 2015 15:25:23 +0800
Message-ID: <OFEBA1B6A8.09949E7B-ON48257DE9.002832A3-48257DE9.0028DBF8@zte.com.cn>
In-Reply-To: <1423452455.5968.47.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9008238052646967551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Does "+1.1% unixbench.score" mean better or worse?

Anyway, this is a load bug fix, does can affect the load balancing =

behavior a little.

Regards,
Xunlei



Huang Ying <ying.huang@intel.com> =

2015-02-09 =E4=B8=8A=E5=8D=88 11:27

=E6=94=B6=E4=BB=B6=E4=BA=BA
Xunlei Pang <pang.xunlei@linaro.org>, =

=E6=8A=84=E9=80=81
Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, LK=
P =

ML <lkp@01.org>
=E4=B8=BB=E9=A2=98
[LKP] [sched/fair] 638476007d1: +1.1% unixbench.score






FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
commit 638476007d13534b2ed4134bf0279ef44071140b ("sched/fair: Fix the =

dealing with decay_count in __synchronize_entity_decay()")

It appears that your patch cause CPU usage increased a little, so that =

unixbench score increased.

testbox/testcase/testparams: nhm-white/unixbench/spawn

7f1a169b88f513e3  638476007d13534b2ed4134bf0 =

----------------  -------------------------- =

         %stddev     %change         %stddev
             \          |                \ =

    268908 =C2=B1  0%      +4.6%     281320 =C2=B1  0% =

unixbench.time.involuntary_context_switches
 1.147e+08 =C2=B1  0%      +1.5%  1.164e+08 =C2=B1  0% =

unixbench.time.minor_page_faults
      3607 =C2=B1  0%      +1.1%       3648 =C2=B1  0%  unixbench.score
       324 =C2=B1  0%      +1.2%        328 =C2=B1  0% =

unixbench.time.percent_of_cpu_this_job_got
       633 =C2=B1  0%      +1.2%        641 =C2=B1  0%  unixbench.time.syst=
em_time
     54100 =C2=B1  3%     +51.0%      81705 =C2=B1 21% =

sched_debug.cpu#4.ttwu_local
     65678 =C2=B1  7%     +49.5%      98187 =C2=B1 16% =

sched_debug.cpu#6.ttwu_local
      5624 =C2=B1 31%     +52.1%       8553 =C2=B1 11% sched_debug.cpu#6.cu=
rr->pid
        58 =C2=B1 20%     +37.6%         80 =C2=B1  7% =

sched_debug.cfs_rq[3]:/.runnable_load_avg
        61 =C2=B1 10%     +22.5%         74 =C2=B1 14% =

sched_debug.cpu#2.cpu_load[3]
    218479 =C2=B1  5%     +15.4%     252190 =C2=B1  5% =

sched_debug.cpu#6.ttwu_count
       102 =C2=B1 17%     -19.3%         82 =C2=B1 10% =

sched_debug.cpu#4.cpu_load[2]
    423974 =C2=B1  4%     +15.6%     490072 =C2=B1  5%  sched_debug.cpu#5.a=
vg_idle
        62 =C2=B1  4%     +16.9%         72 =C2=B1  9% =

sched_debug.cpu#2.cpu_load[4]
    152298 =C2=B1  2%      +9.7%     167037 =C2=B1  3% =

sched_debug.cfs_rq[5]:/.min_vruntime
    156795 =C2=B1  1%     +11.3%     174544 =C2=B1  1% =

sched_debug.cfs_rq[7]:/.min_vruntime
    155535 =C2=B1  3%     +11.8%     173813 =C2=B1  2% =

sched_debug.cfs_rq[6]:/.min_vruntime
      9231 =C2=B1  0%      +1.3%       9348 =C2=B1  0%  vmstat.system.in

nhm-white: Nehalem
Memory: 6G


                            unixbench.time.system_time

  643 =

++---------------------------------------------------------------O----+
  642 ++                    O                                   O  O
      O O  O O  O O O  O O    O  O   O  O O  O   O  O O    O  O   O O |
  641 ++                           O           O         O           O  |
  640 ++  |
      |  |
  639 ++  |
  638 ++  |
  637 ++  |
      |  |
  636 ++  |
  635 ++         .*  |
      *.*.. .*..*  +         .*.. .*.*..  *  |
  634 ++   *        *..*.*..*    *       +  |
  633 =

++--------------------------------*-----------------------------------+


                     unixbench.time.involuntary_context_switches

  286000 =

++-----------------------------------------------------------------+
  284000 ++                                                 O  |
         |                                                    O    O  |
  282000 ++                                                          O O  =

O
  280000 O+O    O          O      O      O  O   O  O O    O     O O |
         |    O      O O O           O O      O        O  |
  278000 ++       O           O O  |
  276000 ++  |
  274000 ++  |
         |  |
  272000 ++  |
  270000 ++  .*.*.              *.*..      .*  |
         *.*.     *..*. .*     :     *.*.*.  |
  268000 ++            *  +    :  |
  266000 =

++----------------*--*---------------------------------------------+


                       kmsg.tsc:Fast_TSC_calibration_failed

    1 =

++-------------------------------------O--------O---------------------+
      |  |
      |  |
  0.8 ++  |
      |  |
      |  |
  0.6 ++  |
      |  |
  0.4 ++  |
      |  |
      |  |
  0.2 ++  |
      |  |
      |  |
    0 =

O+O--O-O--O-O-O--O-O--O-O--O-O-O--O-O----O-O--O----O-O--O-O-O--O-O--O-O

        [*] bisect-good sample
        [O] bisect-bad  sample

To reproduce:

        apt-get install ruby ruby-oj
        git clone =

git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
        cd lkp-tests
        bin/setup-local job.yaml # the job file attached in this email
        bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are =

provided
for informational purposes only. Any difference in system hardware or =

software
design or configuration may affect actual performance.


Thanks,
Huang, Ying


[=E9=99=84=E4=BB=B6 "job.yaml" =E8=A2=AB =E5=BA=9E=E8=AE=AD=E7=A3=8A1011085=
5/user/zte_ltd =E5=88=A0=E9=99=A4][=E9=99=84=E4=BB=B6 "reproduce" =E8=A2=AB =

=E5=BA=9E=E8=AE=AD=E7=A3=8A10110855/user/zte_ltd =E5=88=A0=E9=99=A4
]_______________________________________________
LKP mailing list
LKP(a)linux.intel.com



--------------------------------------------------------
ZTE Information Security Notice: The information contained in this mail (an=
d any attachment transmitted herewith) is privileged and confidential and i=
s intended for the exclusive use of the addressee(s).  If you are not an in=
tended recipient, any disclosure, reproduction, distribution or other disse=
mination or use of the information contained is strictly prohibited.  If yo=
u have received this mail in error, please delete it and notify us immediat=
ely.

--===============9008238052646967551==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPkhlbGxvLDwvZm9udD4NCjxicj4NCjxicj48
Zm9udCBzaXplPTIgZmFjZT0ic2Fucy1zZXJpZiI+RG9lcyAmcXVvdDsrMS4xJSB1bml4YmVuY2gu
c2NvcmUmcXVvdDsNCm1lYW4gYmV0dGVyIG9yIHdvcnNlPzwvZm9udD4NCjxicj4NCjxicj48Zm9u
dCBzaXplPTIgZmFjZT0ic2Fucy1zZXJpZiI+QW55d2F5LCB0aGlzIGlzIGEgbG9hZCBidWcgZml4
LCBkb2VzDQpjYW4gYWZmZWN0IHRoZSBsb2FkIGJhbGFuY2luZyBiZWhhdmlvciBhIGxpdHRsZS48
L2ZvbnQ+DQo8YnI+DQo8YnI+PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPlJlZ2FyZHMs
PC9mb250Pg0KPGJyPjxmb250IHNpemU9MiBmYWNlPSJzYW5zLXNlcmlmIj5YdW5sZWk8L2ZvbnQ+
DQo8YnI+DQo8YnI+DQo8YnI+DQo8dGFibGUgd2lkdGg9MTAwJT4NCjx0ciB2YWxpZ249dG9wPg0K
PHRkIHdpZHRoPTM2JT48Zm9udCBzaXplPTEgZmFjZT0ic2Fucy1zZXJpZiI+PGI+SHVhbmcgWWlu
ZyAmbHQ7eWluZy5odWFuZ0BpbnRlbC5jb20mZ3Q7PC9iPg0KPC9mb250Pg0KPHA+PGZvbnQgc2l6
ZT0xIGZhY2U9InNhbnMtc2VyaWYiPjIwMTUtMDItMDkgyc/O5yAxMToyNzwvZm9udD4NCjx0ZCB3
aWR0aD02MyU+DQo8dGFibGUgd2lkdGg9MTAwJT4NCjx0ciB2YWxpZ249dG9wPg0KPHRkPg0KPGRp
diBhbGlnbj1yaWdodD48Zm9udCBzaXplPTEgZmFjZT0ic2Fucy1zZXJpZiI+ytW8/sjLPC9mb250
PjwvZGl2Pg0KPHRkPjxmb250IHNpemU9MSBmYWNlPSJzYW5zLXNlcmlmIj5YdW5sZWkgUGFuZyAm
bHQ7cGFuZy54dW5sZWlAbGluYXJvLm9yZyZndDssDQo8L2ZvbnQ+DQo8dHIgdmFsaWduPXRvcD4N
Cjx0ZD4NCjxkaXYgYWxpZ249cmlnaHQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPrOt
y808L2ZvbnQ+PC9kaXY+DQo8dGQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPkluZ28g
TW9sbmFyICZsdDttaW5nb0BrZXJuZWwub3JnJmd0OywNCkxLTUwgJmx0O2xpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcmZ3Q7LCBMS1AgTUwgJmx0O2xrcEAwMS5vcmcmZ3Q7PC9mb250Pg0KPHRy
IHZhbGlnbj10b3A+DQo8dGQ+DQo8ZGl2IGFsaWduPXJpZ2h0Pjxmb250IHNpemU9MSBmYWNlPSJz
YW5zLXNlcmlmIj7W98ziPC9mb250PjwvZGl2Pg0KPHRkPjxmb250IHNpemU9MSBmYWNlPSJzYW5z
LXNlcmlmIj5bTEtQXSBbc2NoZWQvZmFpcl0gNjM4NDc2MDA3ZDE6ICsxLjElDQp1bml4YmVuY2gu
c2NvcmU8L2ZvbnQ+PC90YWJsZT4NCjxicj4NCjx0YWJsZT4NCjx0ciB2YWxpZ249dG9wPg0KPHRk
Pg0KPHRkPjwvdGFibGU+DQo8YnI+PC90YWJsZT4NCjxicj4NCjxicj4NCjxicj48dHQ+PGZvbnQg
c2l6ZT0yPkZZSSwgd2Ugbm90aWNlZCB0aGUgYmVsb3cgY2hhbmdlcyBvbjxicj4NCjxicj4NCmdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdCBz
Y2hlZC9jb3JlPGJyPg0KY29tbWl0IDYzODQ3NjAwN2QxMzUzNGIyZWQ0MTM0YmYwMjc5ZWY0NDA3
MTE0MGIgKCZxdW90O3NjaGVkL2ZhaXI6IEZpeA0KdGhlIGRlYWxpbmcgd2l0aCBkZWNheV9jb3Vu
dCBpbiBfX3N5bmNocm9uaXplX2VudGl0eV9kZWNheSgpJnF1b3Q7KTxicj4NCjxicj4NCkl0IGFw
cGVhcnMgdGhhdCB5b3VyIHBhdGNoIGNhdXNlIENQVSB1c2FnZSBpbmNyZWFzZWQgYSBsaXR0bGUs
IHNvIHRoYXQNCnVuaXhiZW5jaCBzY29yZSBpbmNyZWFzZWQuPGJyPg0KPGJyPg0KdGVzdGJveC90
ZXN0Y2FzZS90ZXN0cGFyYW1zOiBuaG0td2hpdGUvdW5peGJlbmNoL3NwYXduPGJyPg0KPGJyPg0K
N2YxYTE2OWI4OGY1MTNlMyAmbmJzcDs2Mzg0NzYwMDdkMTM1MzRiMmVkNDEzNGJmMCAmbmJzcDs8
YnI+DQotLS0tLS0tLS0tLS0tLS0tICZuYnNwOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICZu
YnNwOzxicj4NCiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJXN0ZGRldiAmbmJzcDsgJm5i
c3A7ICVjaGFuZ2UgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAlc3RkZGV2PGJyPg0KICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IFwgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7DQombmJzcDt8ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDtcICZuYnNwOzxicj4NCiAmbmJzcDsgJm5ic3A7MjY4OTA4IKHA
ICZuYnNwOzAlICZuYnNwOyAmbmJzcDsgJm5ic3A7KzQuNiUgJm5ic3A7ICZuYnNwOw0KMjgxMzIw
IKHAICZuYnNwOzAlICZuYnNwO3VuaXhiZW5jaC50aW1lLmludm9sdW50YXJ5X2NvbnRleHRfc3dp
dGNoZXM8YnI+DQogMS4xNDdlKzA4IKHAICZuYnNwOzAlICZuYnNwOyAmbmJzcDsgJm5ic3A7KzEu
NSUgJm5ic3A7MS4xNjRlKzA4IKHAICZuYnNwOzAlDQombmJzcDt1bml4YmVuY2gudGltZS5taW5v
cl9wYWdlX2ZhdWx0czxicj4NCiAmbmJzcDsgJm5ic3A7ICZuYnNwOzM2MDcgocAgJm5ic3A7MCUg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsrMS4xJSAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgMzY0OCChwCAm
bmJzcDswJSAmbmJzcDt1bml4YmVuY2guc2NvcmU8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDsg
MzI0IKHAICZuYnNwOzAlICZuYnNwOyAmbmJzcDsgJm5ic3A7KzEuMiUgJm5ic3A7DQombmJzcDsg
Jm5ic3A7ICZuYnNwOzMyOCChwCAmbmJzcDswJSAmbmJzcDt1bml4YmVuY2gudGltZS5wZXJjZW50
X29mX2NwdV90aGlzX2pvYl9nb3Q8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDsgNjMzIKHAICZu
YnNwOzAlICZuYnNwOyAmbmJzcDsgJm5ic3A7KzEuMiUgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZu
YnNwOzY0MSChwCAmbmJzcDswJSAmbmJzcDt1bml4YmVuY2gudGltZS5zeXN0ZW1fdGltZTxicj4N
CiAmbmJzcDsgJm5ic3A7IDU0MTAwIKHAICZuYnNwOzMlICZuYnNwOyAmbmJzcDsgKzUxLjAlICZu
YnNwOyAmbmJzcDsgJm5ic3A7ODE3MDUNCqHAIDIxJSAmbmJzcDtzY2hlZF9kZWJ1Zy5jcHUjNC50
dHd1X2xvY2FsPGJyPg0KICZuYnNwOyAmbmJzcDsgNjU2NzggocAgJm5ic3A7NyUgJm5ic3A7ICZu
YnNwOyArNDkuNSUgJm5ic3A7ICZuYnNwOyAmbmJzcDs5ODE4Nw0KocAgMTYlICZuYnNwO3NjaGVk
X2RlYnVnLmNwdSM2LnR0d3VfbG9jYWw8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDs1NjI0IKHA
IDMxJSAmbmJzcDsgJm5ic3A7ICs1Mi4xJSAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KODU1MyChwCAx
MSUgJm5ic3A7c2NoZWRfZGVidWcuY3B1IzYuY3Vyci0mZ3Q7cGlkPGJyPg0KICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOzU4IKHAIDIwJSAmbmJzcDsgJm5ic3A7ICszNy42JSAmbmJzcDsgJm5i
c3A7DQombmJzcDsgJm5ic3A7IDgwIKHAICZuYnNwOzclICZuYnNwO3NjaGVkX2RlYnVnLmNmc19y
cVszXTovLnJ1bm5hYmxlX2xvYWRfYXZnPGJyPg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OzYxIKHAIDEwJSAmbmJzcDsgJm5ic3A7ICsyMi41JSAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5i
c3A7IDc0IKHAIDE0JSAmbmJzcDtzY2hlZF9kZWJ1Zy5jcHUjMi5jcHVfbG9hZFszXTxicj4NCiAm
bmJzcDsgJm5ic3A7MjE4NDc5IKHAICZuYnNwOzUlICZuYnNwOyAmbmJzcDsgKzE1LjQlICZuYnNw
OyAmbmJzcDsgMjUyMTkwDQqhwCAmbmJzcDs1JSAmbmJzcDtzY2hlZF9kZWJ1Zy5jcHUjNi50dHd1
X2NvdW50PGJyPg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7IDEwMiChwCAxNyUgJm5ic3A7ICZuYnNw
OyAtMTkuMyUgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyA4MiChwCAxMCUgJm5ic3A7c2No
ZWRfZGVidWcuY3B1IzQuY3B1X2xvYWRbMl08YnI+DQogJm5ic3A7ICZuYnNwOzQyMzk3NCChwCAm
bmJzcDs0JSAmbmJzcDsgJm5ic3A7ICsxNS42JSAmbmJzcDsgJm5ic3A7IDQ5MDA3Mg0KocAgJm5i
c3A7NSUgJm5ic3A7c2NoZWRfZGVidWcuY3B1IzUuYXZnX2lkbGU8YnI+DQogJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7NjIgocAgJm5ic3A7NCUgJm5ic3A7ICZuYnNwOyArMTYuOSUgJm5ic3A7
DQombmJzcDsgJm5ic3A7ICZuYnNwOyA3MiChwCAmbmJzcDs5JSAmbmJzcDtzY2hlZF9kZWJ1Zy5j
cHUjMi5jcHVfbG9hZFs0XTxicj4NCiAmbmJzcDsgJm5ic3A7MTUyMjk4IKHAICZuYnNwOzIlICZu
YnNwOyAmbmJzcDsgJm5ic3A7KzkuNyUgJm5ic3A7ICZuYnNwOw0KMTY3MDM3IKHAICZuYnNwOzMl
ICZuYnNwO3NjaGVkX2RlYnVnLmNmc19ycVs1XTovLm1pbl92cnVudGltZTxicj4NCiAmbmJzcDsg
Jm5ic3A7MTU2Nzk1IKHAICZuYnNwOzElICZuYnNwOyAmbmJzcDsgKzExLjMlICZuYnNwOyAmbmJz
cDsgMTc0NTQ0DQqhwCAmbmJzcDsxJSAmbmJzcDtzY2hlZF9kZWJ1Zy5jZnNfcnFbN106Ly5taW5f
dnJ1bnRpbWU8YnI+DQogJm5ic3A7ICZuYnNwOzE1NTUzNSChwCAmbmJzcDszJSAmbmJzcDsgJm5i
c3A7ICsxMS44JSAmbmJzcDsgJm5ic3A7IDE3MzgxMw0KocAgJm5ic3A7MiUgJm5ic3A7c2NoZWRf
ZGVidWcuY2ZzX3JxWzZdOi8ubWluX3ZydW50aW1lPGJyPg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7
OTIzMSChwCAmbmJzcDswJSAmbmJzcDsgJm5ic3A7ICZuYnNwOysxLjMlICZuYnNwOw0KJm5ic3A7
ICZuYnNwOyA5MzQ4IKHAICZuYnNwOzAlICZuYnNwO3Ztc3RhdC5zeXN0ZW0uaW48YnI+DQo8YnI+
DQpuaG0td2hpdGU6IE5laGFsZW08YnI+DQpNZW1vcnk6IDZHPGJyPg0KPGJyPg0KPGJyPg0KICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7dW5peGJlbmNoLnRpbWUuc3lz
dGVtX3RpbWU8YnI+DQo8YnI+DQogJm5ic3A7NjQzICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tTy0tLS0rPGJyPg0KICZuYnNw
OzY0MiArKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOw0KJm5ic3A7TyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBPICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJz
cDsgJm5ic3A7IE88YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDtPIE8gJm5ic3A7TyBPICZuYnNw
O08gTyBPICZuYnNwO08gTyAmbmJzcDsgJm5ic3A7Tw0KJm5ic3A7TyAmbmJzcDsgTyAmbmJzcDtP
IE8gJm5ic3A7TyAmbmJzcDsgTyAmbmJzcDtPIE8gJm5ic3A7ICZuYnNwO08gJm5ic3A7Tw0KJm5i
c3A7IE8gJm5ic3A7ICZuYnNwOyAmbmJzcDsgTyB8PGJyPg0KICZuYnNwOzY0MSArKyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0K
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IE8gJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyBPICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgTyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7IE8gJm5ic3A7ICZuYnNwOw0KJm5ic3A7fDxicj4NCiAmbmJzcDs2
NDAgKysgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZu
YnNwOyAmbmJzcDsgJm5ic3A7fDxicj4NCiAmbmJzcDsgJm5ic3A7ICZuYnNwO3wgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7IHw8YnI+DQogJm5ic3A7NjM5ICsrICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwO3w8YnI+DQogJm5ic3A7NjM4ICsr
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsg
Jm5ic3A7ICZuYnNwO3w8YnI+DQogJm5ic3A7NjM3ICsrICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwO3w8YnI+DQogJm5i
c3A7ICZuYnNwOyAmbmJzcDt8ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8PGJyPg0KICZuYnNwOzYzNiArKyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
Ow0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNw
OyAmbmJzcDt8PGJyPg0KICZuYnNwOzYzNSArKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
LiogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7IHw8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJz
cDsqLiouLiAuKi4uKiAmbmJzcDsrICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAuKi4uDQou
Ki4qLi4gJm5ic3A7KiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IHw8YnI+DQogJm5ic3A7NjM0ICsrICZuYnNwOyAqICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyouLiouKi4uKiAmbmJzcDsgJm5ic3A7Kg0KJm5ic3A7ICZuYnNwOyAmbmJz
cDsgKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwO3w8YnI+DQogJm5ic3A7NjMzICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0qLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rPGJyPg0KPGJyPg0KPGJy
Pg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOw0KdW5peGJlbmNoLnRpbWUuaW52b2x1bnRhcnlfY29udGV4dF9zd2l0
Y2hlczxicj4NCjxicj4NCiAmbmJzcDsyODYwMDAgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSs8YnI+DQogJm5ic3A7Mjg0
MDAwICsrICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgTyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7
IHw8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7TyAmbmJz
cDsNCiZuYnNwO08gJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fDxicj4NCiAmbmJzcDsyODIw
MDAgKysgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7Tw0KTyAmbmJzcDsgJm5ic3A7
Tzxicj4NCiAmbmJzcDsyODAwMDAgTytPICZuYnNwOyAmbmJzcDtPICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDtPICZuYnNwOw0KJm5ic3A7ICZuYnNwO08gJm5ic3A7ICZuYnNwOyAm
bmJzcDtPICZuYnNwO08gJm5ic3A7IE8gJm5ic3A7TyBPICZuYnNwOw0KJm5ic3A7TyAmbmJzcDsg
Jm5ic3A7IE8gJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IE8gfDxicj4NCiAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgfCAmbmJzcDsgJm5ic3A7TyAmbmJzcDsgJm5ic3A7ICZuYnNwO08g
TyBPDQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IE8gTyAmbmJzcDsgJm5ic3A7
ICZuYnNwO08gJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwO08gJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwO3w8YnI+
DQogJm5ic3A7Mjc4MDAwICsrICZuYnNwOyAmbmJzcDsgJm5ic3A7IE8gJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOw0KTyBPICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
Ow0KfDxicj4NCiAmbmJzcDsyNzYwMDAgKysgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyB8PGJyPg0KICZuYnNwOzI3NDAwMCArKyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7IHw8YnI+DQog
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsN
CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8PGJyPg0KICZuYnNwOzI3MjAwMCAr
KyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7
IHw8YnI+DQogJm5ic3A7MjcwMDAwICsrICZuYnNwOy4qLiouICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsqLiouLiAmbmJzcDsgJm5ic3A7ICZuYnNwOy4q
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8PGJyPg0K
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAqLiouICZuYnNwOyAmbmJzcDsgKi4uKi4gLiog
Jm5ic3A7ICZuYnNwOw0KOiAmbmJzcDsgJm5ic3A7ICouKi4qLiAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHw8YnI+DQogJm5ic3A7MjY4MDAw
ICsrICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7KiAmbmJzcDsrICZu
YnNwOw0KJm5ic3A7OiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwO3w8
YnI+DQogJm5ic3A7MjY2MDAwICsrLS0tLS0tLS0tLS0tLS0tLSotLSotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rPGJyPg0KPGJyPg0KPGJyPg0KICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOw0KJm5ic3A7IGttc2cudHNjOkZhc3RfVFNDX2NhbGlicmF0aW9uX2ZhaWxlZDxicj4NCjxi
cj4NCiAmbmJzcDsgJm5ic3A7MSArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1PLS0tLS0tLS1PLS0tLS0tLS0tLS0tLS0tLS0tLS0tKzxicj4NCiAmbmJzcDsgJm5ic3A7ICZu
YnNwO3wgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQom
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7IHw8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDt8ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyB8PGJyPg0KICZuYnNwOzAuOCArKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDt8PGJyPg0KICZuYnNwOyAmbmJz
cDsgJm5ic3A7fCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfDxicj4NCiAmbmJzcDsgJm5ic3A7ICZuYnNwO3wgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7IHw8YnI+DQogJm5ic3A7MC42ICsrICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwO3w8YnI+DQogJm5ic3A7
ICZuYnNwOyAmbmJzcDt8ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8PGJyPg0KICZuYnNwOzAuNCArKyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0K
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAm
bmJzcDt8PGJyPg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7fCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfDxicj4NCiAm
bmJzcDsgJm5ic3A7ICZuYnNwO3wgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQom
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHw8YnI+DQogJm5ic3A7MC4yICsrICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQombmJzcDsgJm5i
c3A7ICZuYnNwO3w8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDt8ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8PGJy
Pg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7fCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfDxicj4NCiAmbmJzcDsgJm5i
c3A7MCBPK08tLU8tTy0tTy1PLU8tLU8tTy0tTy1PLS1PLU8tTy0tTy1PLS0tLU8tTy0tTy0tLS1P
LU8tLU8tTy1PLS1PLU8tLU8tTzxicj4NCjxicj4NCiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDtbKl0gYmlzZWN0LWdvb2Qgc2FtcGxlPGJyPg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
O1tPXSBiaXNlY3QtYmFkICZuYnNwO3NhbXBsZTxicj4NCjxicj4NClRvIHJlcHJvZHVjZTo8YnI+
DQo8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7YXB0LWdldCBpbnN0YWxsIHJ1Ynkg
cnVieS1vajxicj4NCiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtnaXQgY2xvbmUgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3dmZy9sa3AtdGVzdHMuZ2l0
PGJyPg0KICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2NkIGxrcC10ZXN0czxicj4NCiAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtiaW4vc2V0dXAtbG9jYWwgam9iLnlhbWwgIyB0aGUgam9i
IGZpbGUgYXR0YWNoZWQNCmluIHRoaXMgZW1haWw8YnI+DQogJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7YmluL3J1bi1sb2NhbCAmbmJzcDsgam9iLnlhbWw8YnI+DQo8YnI+DQo8YnI+DQpEaXNj
bGFpbWVyOjxicj4NClJlc3VsdHMgaGF2ZSBiZWVuIGVzdGltYXRlZCBiYXNlZCBvbiBpbnRlcm5h
bCBJbnRlbCBhbmFseXNpcyBhbmQgYXJlIHByb3ZpZGVkPGJyPg0KZm9yIGluZm9ybWF0aW9uYWwg
cHVycG9zZXMgb25seS4gQW55IGRpZmZlcmVuY2UgaW4gc3lzdGVtIGhhcmR3YXJlIG9yIHNvZnR3
YXJlPGJyPg0KZGVzaWduIG9yIGNvbmZpZ3VyYXRpb24gbWF5IGFmZmVjdCBhY3R1YWwgcGVyZm9y
bWFuY2UuPGJyPg0KPGJyPg0KPGJyPg0KVGhhbmtzLDxicj4NCkh1YW5nLCBZaW5nPGJyPg0KPGJy
Pg0KPGJyPg0KW7i9vP4gJnF1b3Q7am9iLnlhbWwmcXVvdDsgsbsgxdPRtcDaMTAxMTA4NTUvdXNl
ci96dGVfbHRkIMm+s/1dW7i9vP4NCiZxdW90O3JlcHJvZHVjZSZxdW90OyCxuyDF09G1wNoxMDEx
MDg1NS91c2VyL3p0ZV9sdGQgyb6z/V1fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXzxicj4NCkxLUCBtYWlsaW5nIGxpc3Q8YnI+DQpMS1BAbGludXguaW50ZWwu
Y29tPGJyPg0KPGJyPg0KPC9mb250PjwvdHQ+DQo8YnI+DQoNCjxicj48cHJlPjxmb250IGNvbG9y
PSJibHVlIj4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQpaVEUgSW5mb3JtYXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgbWFpbCAoYW5kIGFueSBhdHRhY2htZW50IHRyYW5zbWl0dGVk
IGhlcmV3aXRoKSBpcyBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwgYW5kIGlzIGludGVuZGVk
IGZvciB0aGUgZXhjbHVzaXZlIHVzZSBvZiB0aGUgYWRkcmVzc2VlKHMpLiAgSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50LCBhbnkgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBk
aXN0cmlidXRpb24gb3Igb3RoZXIgZGlzc2VtaW5hdGlvbiBvciB1c2Ugb2YgdGhlIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiAgSWYgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBtYWlsIGluIGVycm9yLCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBub3RpZnkgdXMgaW1t
ZWRpYXRlbHkuDQoNCjwvZm9udD48L3ByZT48YnI+DQo=

--===============9008238052646967551==--

