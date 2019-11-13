Content-Type: multipart/mixed; boundary="===============9006921421582399485=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 19f92a030c: apachebench.requests_per_second -37.9% regression
Date: Wed, 13 Nov 2019 08:46:00 -0800
Message-ID: <CANn89iJejNcvARpGR01seeuxV7JViMengX_nqdDV7cfyaisQpQ@mail.gmail.com>
In-Reply-To: <20191113161220.GE65640@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9006921421582399485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 8:12 AM Feng Tang <feng.tang@intel.com> wrote:

> Hi Eric,
>
> On Wed, Nov 13, 2019 at 06:33:44AM -0800, Eric Dumazet wrote:
> > On Wed, Nov 13, 2019 at 2:35 AM Feng Tang <feng.tang@intel.com> wrote:
> > >
> > > Hi Eric,
> > >
> > > On Fri, Nov 08, 2019 at 04:35:13PM +0800, kernel test robot wrote:
> > > > Greeting,
> > > >
> > > > FYI, we noticed a -37.9% regression of
> apachebench.requests_per_second due to commit:
> > > >
> > > > commit: 19f92a030ca6d772ab44b22ee6a01378a8cb32d4 ("net: increase
> SOMAXCONN to 4096")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> master
> > >
> > > Any thought on this? The test is actually:
> > >
> > >         sysctl -w net.ipv4.tcp_syncookies=3D0
> >
> >
> > I have no plan trying to understand why anyone would disable syncookies=
 .
> > This is a non starter really, since this makes a server vulnerable to
> > a trivial DOS attack.
> >
>
> Thanks for the prompt response.
>
> This sysctl change was added to work around one old error when
> running the apachebench. The error was "apr_socket_recv: Connection
> reset by peer (104)"
>
> I just removed the sysctl setting of "ipv4.tcp_synccookies" and
> re-run the same benchmark in 0day, the regression is still there.
>


This is fine. Please setup the sysctls if you need to make a benchmark
shiny.

The defaults should be sane, not based on some artificial workload.

We have been using 4096 at Google for about 5 years, and Google is still
alive.


>
> Thanks,
> Feng
>
> >
> > Since the test changes a sysctl, you also can change other sysctls if
> > you really need to show a ' number of transactions' for a particular
> > benchmark.
> >
> > The change on SOMAXCONN was driven by a security issue, and security
> > comes first.
> >
> >
> > >         enable_apache_mod auth_basic authn_core authn_file authz_core
> authz_host authz_user access_compat
> > >         systemctl restart apache2
> > >         ab -k -q -t 300 -n 1000000 -c 4000 127.0.0.1/
> > >
> > > And some info about apachebench result is:
> > >
> > > w/o patch:
> > >
> > >         Connection Times (ms)
> > >                       min  mean[+/-sd] median   max
> > >         Connect:        0    0  19.5      0    7145
> > >         Processing:     0    4 110.0      3   21647
> > >         Waiting:        0    2  92.4      1   21646
> > >         Total:          0    4 121.1      3   24762
> > >
> > > w/ patch:
> > >
> > >         Connection Times (ms)
> > >                       min  mean[+/-sd] median   max
> > >         Connect:        0    0  43.2      0    7143
> > >         Processing:     0   19 640.4      3   38708
> > >         Waiting:        0   24 796.5      1   38708
> > >         Total:          0   19 657.5      3   39725
> > >
> > >
> > > Thanks,
> > > Feng
> > >
> > > >
> > > > in testcase: apachebench
> > > > on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz
> with 48G memory
> > > > with following parameters:
> > > >
> > > >       runtime: 300s
> > > >       concurrency: 4000
> > > >       cluster: cs-localhost
> > > >       cpufreq_governor: performance
> > > >       ucode: 0x7000019
> > > >
> > > > test-description: apachebench is a tool for benchmarking your Apache
> Hypertext Transfer Protocol (HTTP) server.
> > > > test-url: https://httpd.apache.org/docs/2.4/programs/ab.html
> > > >
> > > > In addition to that, the commit also has significant impact on the
> following tests:
> > > >
> > > >
> +------------------+-----------------------------------------------------=
-------------+
> > > > | testcase: change | apachebench: apachebench.requests_per_second
> -37.5% regression   |
> > > > | test machine     | 16 threads Intel(R) Xeon(R) CPU D-1541 @
> 2.10GHz with 48G memory |
> > > > | test parameters  | cluster=3Dcs-localhost
>                  |
> > > > |                  | concurrency=3D8000
>                  |
> > > > |                  | cpufreq_governor=3Dperformance
>                  |
> > > > |                  | runtime=3D300s
>                  |
> > > > |                  | ucode=3D0x7000019
>                   |
> > > >
> +------------------+-----------------------------------------------------=
-------------+
> > > >
> > > >
> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > > >
> > > >
> > > > Details are as below:
> > > >
> -------------------------------------------------------------------------=
------------------------->
> > > >
> > > >
> > > > To reproduce:
> > > >
> > > >         git clone https://github.com/intel/lkp-tests.git
> > > >         cd lkp-tests
> > > >         bin/lkp install job.yaml  # job file is attached in this
> email
> > > >         bin/lkp run     job.yaml
> > > >
> > > >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> cluster/compiler/concurrency/cpufreq_governor/kconfig/rootfs/runtime/tbox=
_group/testcase/ucode:
> > > >
>  cs-localhost/gcc-7/4000/performance/x86_64-rhel-7.6/debian-x86_64-2019-0=
9-23.cgz/300s/lkp-bdw-de1/apachebench/0x7000019
> > > >
> > > > commit:
> > > >   6d6f0383b6 ("netdevsim: Fix use-after-free during device
> dismantle")
> > > >   19f92a030c ("net: increase SOMAXCONN to 4096")
> > > >
> > > > 6d6f0383b697f004 19f92a030ca6d772ab44b22ee6a
> > > > ---------------- ---------------------------
> > > >          %stddev     %change         %stddev
> > > >              \          |                \
> > > >      22640 =C2=B1  4%     +71.1%      38734
> apachebench.connection_time.processing.max
> > > >      24701           +60.9%      39743
> apachebench.connection_time.total.max
> > > >      22639 =C2=B1  4%     +71.1%      38734
> apachebench.connection_time.waiting.max
> > > >      24701        +15042.0       39743
> apachebench.max_latency.100%
> > > >      40454           -37.9%      25128
> apachebench.requests_per_second
> > > >      25.69           +58.8%      40.79
> apachebench.time.elapsed_time
> > > >      25.69           +58.8%      40.79
> apachebench.time.elapsed_time.max
> > > >      79.00           -37.0%      49.75
> apachebench.time.percent_of_cpu_this_job_got
> > > >      98.88           +61.0%     159.18
> apachebench.time_per_request
> > > >     434631           -37.9%     269889
> apachebench.transfer_rate
> > > >    1.5e+08 =C2=B1 18%    +109.5%  3.141e+08 =C2=B1 27%  cpuidle.C3.=
time
> > > >     578957 =C2=B1  7%     +64.1%     949934 =C2=B1 12%  cpuidle.C3.=
usage
> > > >      79085 =C2=B1  4%     +24.8%      98720        meminfo.AnonHuge=
Pages
> > > >      41176           +14.2%      47013        meminfo.PageTables
> > > >      69429           -34.9%      45222        meminfo.max_used_kB
> > > >      63.48           +12.7       76.15        mpstat.cpu.all.idle%
> > > >       2.42 =C2=B1  2%      -0.9        1.56        mpstat.cpu.all.s=
oft%
> > > >      15.30            -5.2       10.13        mpstat.cpu.all.sys%
> > > >      18.80            -6.6       12.16        mpstat.cpu.all.usr%
> > > >      65.00           +17.7%      76.50        vmstat.cpu.id
> > > >      17.00           -35.3%      11.00        vmstat.cpu.us
> > > >       7.00 =C2=B1 24%     -50.0%       3.50 =C2=B1 14%  vmstat.proc=
s.r
> > > >      62957           -33.3%      42012        vmstat.system.cs
> > > >      33174            -1.4%      32693        vmstat.system.in
>

--===============9006921421582399485==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgTm92
IDEzLCAyMDE5IGF0IDg6MTIgQU0gRmVuZyBUYW5nICZsdDs8YSBocmVmPSJtYWlsdG86ZmVuZy50
YW5nQGludGVsLmNvbSI+ZmVuZy50YW5nQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+SGkgRXJpYyw8YnI+Cjxicj4KT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDY6MzM6
NDRBTSAtMDgwMCwgRXJpYyBEdW1hemV0IHdyb3RlOjxicj4KJmd0OyBPbiBXZWQsIE5vdiAxMywg
MjAxOSBhdCAyOjM1IEFNIEZlbmcgVGFuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmZlbmcudGFuZ0Bp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5mZW5nLnRhbmdAaW50ZWwuY29tPC9hPiZndDsgd3Jv
dGU6PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyBIaSBFcmljLDxicj4KJmd0OyAmZ3Q7PGJy
PgomZ3Q7ICZndDsgT24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDQ6MzU6MTNQTSArMDgwMCwga2Vy
bmVsIHRlc3Qgcm9ib3Qgd3JvdGU6PGJyPgomZ3Q7ICZndDsgJmd0OyBHcmVldGluZyw8YnI+CiZn
dDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyBGWUksIHdlIG5vdGljZWQgYSAtMzcuOSUg
cmVncmVzc2lvbiBvZiBhcGFjaGViZW5jaC5yZXF1ZXN0c19wZXJfc2Vjb25kIGR1ZSB0byBjb21t
aXQ6PGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7ICZndDsgY29tbWl0OiAxOWY5MmEw
MzBjYTZkNzcyYWI0NGIyMmVlNmEwMTM3OGE4Y2IzMmQ0ICgmcXVvdDtuZXQ6IGluY3JlYXNlIFNP
TUFYQ09OTiB0byA0MDk2JnF1b3Q7KTxicj4KJmd0OyAmZ3Q7ICZndDsgPGEgaHJlZj0iaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdC5rZXJuZWwub3Jn
L2NnaXQvbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQ8L2E+IG1hc3Rlcjxicj4K
Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgQW55IHRob3VnaHQgb24gdGhpcz8gVGhlIHRlc3QgaXMg
YWN0dWFsbHk6PGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0O8KgIMKgIMKgIMKgIMKgc3lzY3Rs
IC13IG5ldC5pcHY0LnRjcF9zeW5jb29raWVzPTA8YnI+CiZndDsgPGJyPgomZ3Q7PGJyPgomZ3Q7
IEkgaGF2ZSBubyBwbGFuIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoeSBhbnlvbmUgd291bGQgZGlz
YWJsZSBzeW5jb29raWVzIC48YnI+CiZndDsgVGhpcyBpcyBhIG5vbiBzdGFydGVyIHJlYWxseSwg
c2luY2UgdGhpcyBtYWtlcyBhIHNlcnZlciB2dWxuZXJhYmxlIHRvPGJyPgomZ3Q7IGEgdHJpdmlh
bCBET1MgYXR0YWNrLjxicj4KJmd0Ozxicj4KPGJyPgpUaGFua3MgZm9yIHRoZSBwcm9tcHQgcmVz
cG9uc2UuPGJyPgo8YnI+ClRoaXMgc3lzY3RsIGNoYW5nZSB3YXMgYWRkZWQgdG8gd29yayBhcm91
bmQgb25lIG9sZCBlcnJvciB3aGVuPGJyPgpydW5uaW5nIHRoZSBhcGFjaGViZW5jaC4gVGhlIGVy
cm9yIHdhcyAmcXVvdDthcHJfc29ja2V0X3JlY3Y6IENvbm5lY3Rpb248YnI+CnJlc2V0IGJ5IHBl
ZXIgKDEwNCkmcXVvdDs8YnI+Cjxicj4KSSBqdXN0IHJlbW92ZWQgdGhlIHN5c2N0bCBzZXR0aW5n
IG9mICZxdW90O2lwdjQudGNwX3N5bmNjb29raWVzJnF1b3Q7IGFuZCA8YnI+CnJlLXJ1biB0aGUg
c2FtZSBiZW5jaG1hcmsgaW4gMGRheSwgdGhlIHJlZ3Jlc3Npb24gaXMgc3RpbGwgdGhlcmUuIDxi
cj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIGlz
IGZpbmUuIFBsZWFzZSBzZXR1cCB0aGUgc3lzY3RscyBpZiB5b3UgbmVlZCB0byBtYWtlIGEgYmVu
Y2htYXJrIHNoaW55LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIGRlZmF1bHRzIHNob3Vs
ZCBiZSBzYW5lLCBub3QgYmFzZWQgb24gc29tZSBhcnRpZmljaWFsIHdvcmtsb2FkLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+V2UgaGF2ZSBiZWVuIHVzaW5nIDQwOTYgYXQgR29vZ2xlIGZvciBh
Ym91dCA1IHllYXJzLCBhbmQgR29vZ2xlIGlzIHN0aWxsIGFsaXZlLjwvZGl2PjxkaXY+wqA8L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+Cjxicj4KVGhhbmtzLDxicj4KRmVuZzxicj4KPGJyPgomZ3Q7IDxicj4KJmd0OyBT
aW5jZSB0aGUgdGVzdCBjaGFuZ2VzIGEgc3lzY3RsLCB5b3UgYWxzbyBjYW4gY2hhbmdlIG90aGVy
IHN5c2N0bHMgaWY8YnI+CiZndDsgeW91IHJlYWxseSBuZWVkIHRvIHNob3cgYSAmIzM5OyBudW1i
ZXIgb2YgdHJhbnNhY3Rpb25zJiMzOTsgZm9yIGEgcGFydGljdWxhcjxicj4KJmd0OyBiZW5jaG1h
cmsuPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGUgY2hhbmdlIG9uIFNPTUFYQ09OTiB3YXMgZHJpdmVu
IGJ5IGEgc2VjdXJpdHkgaXNzdWUsIGFuZCBzZWN1cml0eTxicj4KJmd0OyBjb21lcyBmaXJzdC48
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAmZ3Q7wqAgwqAgwqAgwqAgwqBlbmFibGVfYXBh
Y2hlX21vZCBhdXRoX2Jhc2ljIGF1dGhuX2NvcmUgYXV0aG5fZmlsZSBhdXRoel9jb3JlIGF1dGh6
X2hvc3QgYXV0aHpfdXNlciBhY2Nlc3NfY29tcGF0PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCDCoCDC
oHN5c3RlbWN0bCByZXN0YXJ0IGFwYWNoZTI8YnI+CiZndDsgJmd0O8KgIMKgIMKgIMKgIMKgYWIg
LWsgLXEgLXQgMzAwIC1uIDEwMDAwMDAgLWMgNDAwMCA8YSBocmVmPSJodHRwOi8vMTI3LjAuMC4x
LyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MTI3LjAuMC4xLzwvYT48YnI+CiZn
dDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IEFuZCBzb21lIGluZm8gYWJvdXQgYXBhY2hlYmVuY2ggcmVz
dWx0IGlzOjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgdy9vIHBhdGNoOjxicj4KJmd0OyAm
Z3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCDCoCDCoENvbm5lY3Rpb24gVGltZXMgKG1zKTxicj4K
Jmd0OyAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtaW7CoCBtZWFuWysv
LXNkXSBtZWRpYW7CoCDCoG1heDxicj4KJmd0OyAmZ3Q7wqAgwqAgwqAgwqAgwqBDb25uZWN0OsKg
IMKgIMKgIMKgIDDCoCDCoCAwwqAgMTkuNcKgIMKgIMKgIDDCoCDCoCA3MTQ1PGJyPgomZ3Q7ICZn
dDvCoCDCoCDCoCDCoCDCoFByb2Nlc3Npbmc6wqAgwqAgwqAwwqAgwqAgNCAxMTAuMMKgIMKgIMKg
IDPCoCDCoDIxNjQ3PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCDCoCDCoFdhaXRpbmc6wqAgwqAgwqAg
wqAgMMKgIMKgIDLCoCA5Mi40wqAgwqAgwqAgMcKgIMKgMjE2NDY8YnI+CiZndDsgJmd0O8KgIMKg
IMKgIMKgIMKgVG90YWw6wqAgwqAgwqAgwqAgwqAgMMKgIMKgIDQgMTIxLjHCoCDCoCDCoCAzwqAg
wqAyNDc2Mjxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgdy8gcGF0Y2g6PGJyPgomZ3Q7ICZn
dDs8YnI+CiZndDsgJmd0O8KgIMKgIMKgIMKgIMKgQ29ubmVjdGlvbiBUaW1lcyAobXMpPGJyPgom
Z3Q7ICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1pbsKgIG1lYW5bKy8t
c2RdIG1lZGlhbsKgIMKgbWF4PGJyPgomZ3Q7ICZndDvCoCDCoCDCoCDCoCDCoENvbm5lY3Q6wqAg
wqAgwqAgwqAgMMKgIMKgIDDCoCA0My4ywqAgwqAgwqAgMMKgIMKgIDcxNDM8YnI+CiZndDsgJmd0
O8KgIMKgIMKgIMKgIMKgUHJvY2Vzc2luZzrCoCDCoCDCoDDCoCDCoDE5IDY0MC40wqAgwqAgwqAg
M8KgIMKgMzg3MDg8YnI+CiZndDsgJmd0O8KgIMKgIMKgIMKgIMKgV2FpdGluZzrCoCDCoCDCoCDC
oCAwwqAgwqAyNCA3OTYuNcKgIMKgIMKgIDHCoCDCoDM4NzA4PGJyPgomZ3Q7ICZndDvCoCDCoCDC
oCDCoCDCoFRvdGFsOsKgIMKgIMKgIMKgIMKgIDDCoCDCoDE5IDY1Ny41wqAgwqAgwqAgM8KgIMKg
Mzk3MjU8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgVGhhbmtzLDxi
cj4KJmd0OyAmZ3Q7IEZlbmc8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZn
dDsgJmd0OyAmZ3Q7IGluIHRlc3RjYXNlOiBhcGFjaGViZW5jaDxicj4KJmd0OyAmZ3Q7ICZndDsg
b24gdGVzdCBtYWNoaW5lOiAxNiB0aHJlYWRzIEludGVsKFIpIFhlb24oUikgQ1BVIEQtMTU0MSBA
IDIuMTBHSHogd2l0aCA0OEcgbWVtb3J5PGJyPgomZ3Q7ICZndDsgJmd0OyB3aXRoIGZvbGxvd2lu
ZyBwYXJhbWV0ZXJzOjxicj4KJmd0OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAg
wqAgwqBydW50aW1lOiAzMDBzPGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIMKgY29uY3VycmVu
Y3k6IDQwMDA8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgwqBjbHVzdGVyOiBjcy1sb2NhbGhv
c3Q8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgwqBjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3Jt
YW5jZTxicj4KJmd0OyAmZ3Q7ICZndDvCoCDCoCDCoCDCoHVjb2RlOiAweDcwMDAwMTk8YnI+CiZn
dDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyB0ZXN0LWRlc2NyaXB0aW9uOiBhcGFjaGVi
ZW5jaCBpcyBhIHRvb2wgZm9yIGJlbmNobWFya2luZyB5b3VyIEFwYWNoZSBIeXBlcnRleHQgVHJh
bnNmZXIgUHJvdG9jb2wgKEhUVFApIHNlcnZlci48YnI+CiZndDsgJmd0OyAmZ3Q7IHRlc3QtdXJs
OiA8YSBocmVmPSJodHRwczovL2h0dHBkLmFwYWNoZS5vcmcvZG9jcy8yLjQvcHJvZ3JhbXMvYWIu
aHRtbCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9odHRwZC5hcGFj
aGUub3JnL2RvY3MvMi40L3Byb2dyYW1zL2FiLmh0bWw8L2E+PGJyPgomZ3Q7ICZndDsgJmd0Ozxi
cj4KJmd0OyAmZ3Q7ICZndDsgSW4gYWRkaXRpb24gdG8gdGhhdCwgdGhlIGNvbW1pdCBhbHNvIGhh
cyBzaWduaWZpY2FudCBpbXBhY3Qgb24gdGhlIGZvbGxvd2luZyB0ZXN0czo8YnI+CiZndDsgJmd0
OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0OyArLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSs8
YnI+CiZndDsgJmd0OyAmZ3Q7IHwgdGVzdGNhc2U6IGNoYW5nZSB8IGFwYWNoZWJlbmNoOiBhcGFj
aGViZW5jaC5yZXF1ZXN0c19wZXJfc2Vjb25kIC0zNy41JSByZWdyZXNzaW9uwqAgwqB8PGJyPgom
Z3Q7ICZndDsgJmd0OyB8IHRlc3QgbWFjaGluZcKgIMKgIMKgfCAxNiB0aHJlYWRzIEludGVsKFIp
IFhlb24oUikgQ1BVIEQtMTU0MSBAIDIuMTBHSHogd2l0aCA0OEcgbWVtb3J5IHw8YnI+CiZndDsg
Jmd0OyAmZ3Q7IHwgdGVzdCBwYXJhbWV0ZXJzwqAgfCBjbHVzdGVyPWNzLWxvY2FsaG9zdMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfDxicj4KJmd0OyAmZ3Q7ICZndDsgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwg
Y29uY3VycmVuY3k9ODAwMMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4KJmd0OyAmZ3Q7ICZndDsgfMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgY3B1ZnJlcV9nb3Zlcm5vcj1wZXJmb3JtYW5jZcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxi
cj4KJmd0OyAmZ3Q7ICZndDsgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgcnVudGltZT0z
MDBzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPgomZ3Q7ICZndDsgJmd0OyB8wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfCB1Y29kZT0weDcwMDAwMTnCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJy
PgomZ3Q7ICZndDsgJmd0OyArLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSs8YnI+CiZndDsg
Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7ICZndDsgSWYgeW91IGZp
eCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZzxicj4KJmd0OyAmZ3Q7ICZndDsg
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86cm9uZy5h
LmNoZW5AaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cm9uZy5hLmNoZW5AaW50ZWwuY29tPC9h
PiZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7
ICZndDsgRGV0YWlscyBhcmUgYXMgYmVsb3c6PGJyPgomZ3Q7ICZndDsgJmd0OyAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7PGJy
PgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7ICZndDsgVG8gcmVwcm9kdWNlOjxicj4KJmd0
OyAmZ3Q7ICZndDs8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgwqAgwqBnaXQgY2xvbmUgPGEg
aHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMu
Z2l0PC9hPjxicj4KJmd0OyAmZ3Q7ICZndDvCoCDCoCDCoCDCoCDCoGNkIGxrcC10ZXN0czxicj4K
Jmd0OyAmZ3Q7ICZndDvCoCDCoCDCoCDCoCDCoGJpbi9sa3AgaW5zdGFsbCBqb2IueWFtbMKgICMg
am9iIGZpbGUgaXMgYXR0YWNoZWQgaW4gdGhpcyBlbWFpbDxicj4KJmd0OyAmZ3Q7ICZndDvCoCDC
oCDCoCDCoCDCoGJpbi9sa3AgcnVuwqAgwqAgwqBqb2IueWFtbDxicj4KJmd0OyAmZ3Q7ICZndDs8
YnI+CiZndDsgJmd0OyAmZ3Q7ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJyPgom
Z3Q7ICZndDsgJmd0OyBjbHVzdGVyL2NvbXBpbGVyL2NvbmN1cnJlbmN5L2NwdWZyZXFfZ292ZXJu
b3Iva2NvbmZpZy9yb290ZnMvcnVudGltZS90Ym94X2dyb3VwL3Rlc3RjYXNlL3Vjb2RlOjxicj4K
Jmd0OyAmZ3Q7ICZndDvCoCDCoGNzLWxvY2FsaG9zdC9nY2MtNy80MDAwL3BlcmZvcm1hbmNlL3g4
Nl82NC1yaGVsLTcuNi9kZWJpYW4teDg2XzY0LTIwMTktMDktMjMuY2d6LzMwMHMvbGtwLWJkdy1k
ZTEvYXBhY2hlYmVuY2gvMHg3MDAwMDE5PGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7
ICZndDsgY29tbWl0Ojxicj4KJmd0OyAmZ3Q7ICZndDvCoCDCoDZkNmYwMzgzYjYgKCZxdW90O25l
dGRldnNpbTogRml4IHVzZS1hZnRlci1mcmVlIGR1cmluZyBkZXZpY2UgZGlzbWFudGxlJnF1b3Q7
KTxicj4KJmd0OyAmZ3Q7ICZndDvCoCDCoDE5ZjkyYTAzMGMgKCZxdW90O25ldDogaW5jcmVhc2Ug
U09NQVhDT05OIHRvIDQwOTYmcXVvdDspPGJyPgomZ3Q7ICZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7
ICZndDsgNmQ2ZjAzODNiNjk3ZjAwNCAxOWY5MmEwMzBjYTZkNzcyYWI0NGIyMmVlNmE8YnI+CiZn
dDsgJmd0OyAmZ3Q7IC0tLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
PGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIMKgIMKgICVzdGRkZXbCoCDCoCDCoCVjaGFuZ2XC
oCDCoCDCoCDCoCDCoCVzdGRkZXY8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgXMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPgomZ3Q7ICZn
dDsgJmd0O8KgIMKgIMKgIDIyNjQwIMKxwqAgNCXCoCDCoCDCoCs3MS4xJcKgIMKgIMKgIDM4NzM0
wqAgwqAgwqAgwqAgYXBhY2hlYmVuY2guY29ubmVjdGlvbl90aW1lLnByb2Nlc3NpbmcubWF4PGJy
PgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIDI0NzAxwqAgwqAgwqAgwqAgwqAgwqArNjAuOSXCoCDC
oCDCoCAzOTc0M8KgIMKgIMKgIMKgIGFwYWNoZWJlbmNoLmNvbm5lY3Rpb25fdGltZS50b3RhbC5t
YXg8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgMjI2MzkgwrHCoCA0JcKgIMKgIMKgKzcxLjEl
wqAgwqAgwqAgMzg3MzTCoCDCoCDCoCDCoCBhcGFjaGViZW5jaC5jb25uZWN0aW9uX3RpbWUud2Fp
dGluZy5tYXg8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgMjQ3MDHCoCDCoCDCoCDCoCArMTUw
NDIuMMKgIMKgIMKgIMKgMzk3NDPCoCDCoCDCoCDCoCBhcGFjaGViZW5jaC5tYXhfbGF0ZW5jeS4x
MDAlPGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIDQwNDU0wqAgwqAgwqAgwqAgwqAgwqAtMzcu
OSXCoCDCoCDCoCAyNTEyOMKgIMKgIMKgIMKgIGFwYWNoZWJlbmNoLnJlcXVlc3RzX3Blcl9zZWNv
bmQ8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgMjUuNjnCoCDCoCDCoCDCoCDCoCDCoCs1OC44
JcKgIMKgIMKgIDQwLjc5wqAgwqAgwqAgwqAgYXBhY2hlYmVuY2gudGltZS5lbGFwc2VkX3RpbWU8
YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgMjUuNjnCoCDCoCDCoCDCoCDCoCDCoCs1OC44JcKg
IMKgIMKgIDQwLjc5wqAgwqAgwqAgwqAgYXBhY2hlYmVuY2gudGltZS5lbGFwc2VkX3RpbWUubWF4
PGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIDc5LjAwwqAgwqAgwqAgwqAgwqAgwqAtMzcuMCXC
oCDCoCDCoCA0OS43NcKgIMKgIMKgIMKgIGFwYWNoZWJlbmNoLnRpbWUucGVyY2VudF9vZl9jcHVf
dGhpc19qb2JfZ290PGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIDk4Ljg4wqAgwqAgwqAgwqAg
wqAgwqArNjEuMCXCoCDCoCDCoDE1OS4xOMKgIMKgIMKgIMKgIGFwYWNoZWJlbmNoLnRpbWVfcGVy
X3JlcXVlc3Q8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqA0MzQ2MzHCoCDCoCDCoCDCoCDCoCDC
oC0zNy45JcKgIMKgIMKgMjY5ODg5wqAgwqAgwqAgwqAgYXBhY2hlYmVuY2gudHJhbnNmZXJfcmF0
ZTxicj4KJmd0OyAmZ3Q7ICZndDvCoCDCoCAxLjVlKzA4IMKxIDE4JcKgIMKgICsxMDkuNSXCoCAz
LjE0MWUrMDggwrEgMjclwqAgY3B1aWRsZS5DMy50aW1lPGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKg
IMKgNTc4OTU3IMKxwqAgNyXCoCDCoCDCoCs2NC4xJcKgIMKgIMKgOTQ5OTM0IMKxIDEyJcKgIGNw
dWlkbGUuQzMudXNhZ2U8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgNzkwODUgwrHCoCA0JcKg
IMKgIMKgKzI0LjglwqAgwqAgwqAgOTg3MjDCoCDCoCDCoCDCoCBtZW1pbmZvLkFub25IdWdlUGFn
ZXM8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAgwqAgNDExNzbCoCDCoCDCoCDCoCDCoCDCoCsxNC4y
JcKgIMKgIMKgIDQ3MDEzwqAgwqAgwqAgwqAgbWVtaW5mby5QYWdlVGFibGVzPGJyPgomZ3Q7ICZn
dDsgJmd0O8KgIMKgIMKgIDY5NDI5wqAgwqAgwqAgwqAgwqAgwqAtMzQuOSXCoCDCoCDCoCA0NTIy
MsKgIMKgIMKgIMKgIG1lbWluZm8ubWF4X3VzZWRfa0I8YnI+CiZndDsgJmd0OyAmZ3Q7wqAgwqAg
wqAgNjMuNDjCoCDCoCDCoCDCoCDCoCDCoCsxMi43wqAgwqAgwqAgwqA3Ni4xNcKgIMKgIMKgIMKg
IG1wc3RhdC5jcHUuYWxsLmlkbGUlPGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIMKgMi40MiDC
scKgIDIlwqAgwqAgwqAgLTAuOcKgIMKgIMKgIMKgIDEuNTbCoCDCoCDCoCDCoCBtcHN0YXQuY3B1
LmFsbC5zb2Z0JTxicj4KJmd0OyAmZ3Q7ICZndDvCoCDCoCDCoCAxNS4zMMKgIMKgIMKgIMKgIMKg
IMKgIC01LjLCoCDCoCDCoCDCoDEwLjEzwqAgwqAgwqAgwqAgbXBzdGF0LmNwdS5hbGwuc3lzJTxi
cj4KJmd0OyAmZ3Q7ICZndDvCoCDCoCDCoCAxOC44MMKgIMKgIMKgIMKgIMKgIMKgIC02LjbCoCDC
oCDCoCDCoDEyLjE2wqAgwqAgwqAgwqAgbXBzdGF0LmNwdS5hbGwudXNyJTxicj4KJmd0OyAmZ3Q7
ICZndDvCoCDCoCDCoCA2NS4wMMKgIMKgIMKgIMKgIMKgIMKgKzE3LjclwqAgwqAgwqAgNzYuNTDC
oCDCoCDCoCDCoCA8YSBocmVmPSJodHRwOi8vdm1zdGF0LmNwdS5pZCIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+dm1zdGF0LmNwdS5pZDwvYT48YnI+CiZndDsgJmd0OyAmZ3Q7wqAg
wqAgwqAgMTcuMDDCoCDCoCDCoCDCoCDCoCDCoC0zNS4zJcKgIMKgIMKgIDExLjAwwqAgwqAgwqAg
wqAgPGEgaHJlZj0iaHR0cDovL3Ztc3RhdC5jcHUudXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPnZtc3RhdC5jcHUudXM8L2E+PGJyPgomZ3Q7ICZndDsgJmd0O8KgIMKgIMKgIMKg
Ny4wMCDCsSAyNCXCoCDCoCDCoC01MC4wJcKgIMKgIMKgIMKgMy41MCDCsSAxNCXCoCB2bXN0YXQu
cHJvY3Mucjxicj4KJmd0OyAmZ3Q7ICZndDvCoCDCoCDCoCA2Mjk1N8KgIMKgIMKgIMKgIMKgIMKg
LTMzLjMlwqAgwqAgwqAgNDIwMTLCoCDCoCDCoCDCoCB2bXN0YXQuc3lzdGVtLmNzPGJyPgomZ3Q7
ICZndDsgJmd0O8KgIMKgIMKgIDMzMTc0wqAgwqAgwqAgwqAgwqAgwqAgLTEuNCXCoCDCoCDCoCAz
MjY5M8KgIMKgIMKgIMKgIDxhIGhyZWY9Imh0dHA6Ly92bXN0YXQuc3lzdGVtLmluIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj52bXN0YXQuc3lzdGVtLmluPC9hPjxicj4KPC9ibG9j
a3F1b3RlPjwvZGl2PjwvZGl2Pgo=

--===============9006921421582399485==--

