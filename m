Content-Type: multipart/mixed; boundary="===============4702253139092002650=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 19f92a030c: apachebench.requests_per_second -37.9% regression
Date: Thu, 14 Nov 2019 00:12:20 +0800
Message-ID: <20191113161220.GE65640@shbuild999.sh.intel.com>
In-Reply-To: <CANn89iLnzk5bGzSD5RHa6yuny6c_iaRBE4MfKhTqbTzeX_aZ6A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4702253139092002650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wed, Nov 13, 2019 at 06:33:44AM -0800, Eric Dumazet wrote:
> On Wed, Nov 13, 2019 at 2:35 AM Feng Tang <feng.tang@intel.com> wrote:
> >
> > Hi Eric,
> >
> > On Fri, Nov 08, 2019 at 04:35:13PM +0800, kernel test robot wrote:
> > > Greeting,
> > >
> > > FYI, we noticed a -37.9% regression of apachebench.requests_per_secon=
d due to commit:
> > >
> > > commit: 19f92a030ca6d772ab44b22ee6a01378a8cb32d4 ("net: increase SOMA=
XCONN to 4096")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > Any thought on this? The test is actually:
> >
> >         sysctl -w net.ipv4.tcp_syncookies=3D0
> =

>
> I have no plan trying to understand why anyone would disable syncookies .
> This is a non starter really, since this makes a server vulnerable to
> a trivial DOS attack.
>

Thanks for the prompt response.

This sysctl change was added to work around one old error when
running the apachebench. The error was "apr_socket_recv: Connection
reset by peer (104)"

I just removed the sysctl setting of "ipv4.tcp_synccookies" and =

re-run the same benchmark in 0day, the regression is still there. =


Thanks,
Feng

> =

> Since the test changes a sysctl, you also can change other sysctls if
> you really need to show a ' number of transactions' for a particular
> benchmark.
> =

> The change on SOMAXCONN was driven by a security issue, and security
> comes first.
> =

> =

> >         enable_apache_mod auth_basic authn_core authn_file authz_core a=
uthz_host authz_user access_compat
> >         systemctl restart apache2
> >         ab -k -q -t 300 -n 1000000 -c 4000 127.0.0.1/
> >
> > And some info about apachebench result is:
> >
> > w/o patch:
> >
> >         Connection Times (ms)
> >                       min  mean[+/-sd] median   max
> >         Connect:        0    0  19.5      0    7145
> >         Processing:     0    4 110.0      3   21647
> >         Waiting:        0    2  92.4      1   21646
> >         Total:          0    4 121.1      3   24762
> >
> > w/ patch:
> >
> >         Connection Times (ms)
> >                       min  mean[+/-sd] median   max
> >         Connect:        0    0  43.2      0    7143
> >         Processing:     0   19 640.4      3   38708
> >         Waiting:        0   24 796.5      1   38708
> >         Total:          0   19 657.5      3   39725
> >
> >
> > Thanks,
> > Feng
> >
> > >
> > > in testcase: apachebench
> > > on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz wit=
h 48G memory
> > > with following parameters:
> > >
> > >       runtime: 300s
> > >       concurrency: 4000
> > >       cluster: cs-localhost
> > >       cpufreq_governor: performance
> > >       ucode: 0x7000019
> > >
> > > test-description: apachebench is a tool for benchmarking your Apache =
Hypertext Transfer Protocol (HTTP) server.
> > > test-url: https://httpd.apache.org/docs/2.4/programs/ab.html
> > >
> > > In addition to that, the commit also has significant impact on the fo=
llowing tests:
> > >
> > > +------------------+-------------------------------------------------=
-----------------+
> > > | testcase: change | apachebench: apachebench.requests_per_second -37=
.5% regression   |
> > > | test machine     | 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz=
 with 48G memory |
> > > | test parameters  | cluster=3Dcs-localhost                          =
                   |
> > > |                  | concurrency=3D8000                              =
                   |
> > > |                  | cpufreq_governor=3Dperformance                  =
                   |
> > > |                  | runtime=3D300s                                  =
                   |
> > > |                  | ucode=3D0x7000019                               =
                   |
> > > +------------------+-------------------------------------------------=
-----------------+
> > >
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > >
> > >
> > > Details are as below:
> > > ---------------------------------------------------------------------=
----------------------------->
> > >
> > >
> > > To reproduce:
> > >
> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp install job.yaml  # job file is attached in this email
> > >         bin/lkp run     job.yaml
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > cluster/compiler/concurrency/cpufreq_governor/kconfig/rootfs/runtime/=
tbox_group/testcase/ucode:
> > >   cs-localhost/gcc-7/4000/performance/x86_64-rhel-7.6/debian-x86_64-2=
019-09-23.cgz/300s/lkp-bdw-de1/apachebench/0x7000019
> > >
> > > commit:
> > >   6d6f0383b6 ("netdevsim: Fix use-after-free during device dismantle")
> > >   19f92a030c ("net: increase SOMAXCONN to 4096")
> > >
> > > 6d6f0383b697f004 19f92a030ca6d772ab44b22ee6a
> > > ---------------- ---------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >      22640 =C2=B1  4%     +71.1%      38734        apachebench.connec=
tion_time.processing.max
> > >      24701           +60.9%      39743        apachebench.connection_=
time.total.max
> > >      22639 =C2=B1  4%     +71.1%      38734        apachebench.connec=
tion_time.waiting.max
> > >      24701        +15042.0       39743        apachebench.max_latency=
.100%
> > >      40454           -37.9%      25128        apachebench.requests_pe=
r_second
> > >      25.69           +58.8%      40.79        apachebench.time.elapse=
d_time
> > >      25.69           +58.8%      40.79        apachebench.time.elapse=
d_time.max
> > >      79.00           -37.0%      49.75        apachebench.time.percen=
t_of_cpu_this_job_got
> > >      98.88           +61.0%     159.18        apachebench.time_per_re=
quest
> > >     434631           -37.9%     269889        apachebench.transfer_ra=
te
> > >    1.5e+08 =C2=B1 18%    +109.5%  3.141e+08 =C2=B1 27%  cpuidle.C3.ti=
me
> > >     578957 =C2=B1  7%     +64.1%     949934 =C2=B1 12%  cpuidle.C3.us=
age
> > >      79085 =C2=B1  4%     +24.8%      98720        meminfo.AnonHugePa=
ges
> > >      41176           +14.2%      47013        meminfo.PageTables
> > >      69429           -34.9%      45222        meminfo.max_used_kB
> > >      63.48           +12.7       76.15        mpstat.cpu.all.idle%
> > >       2.42 =C2=B1  2%      -0.9        1.56        mpstat.cpu.all.sof=
t%
> > >      15.30            -5.2       10.13        mpstat.cpu.all.sys%
> > >      18.80            -6.6       12.16        mpstat.cpu.all.usr%
> > >      65.00           +17.7%      76.50        vmstat.cpu.id
> > >      17.00           -35.3%      11.00        vmstat.cpu.us
> > >       7.00 =C2=B1 24%     -50.0%       3.50 =C2=B1 14%  vmstat.procs.r
> > >      62957           -33.3%      42012        vmstat.system.cs
> > >      33174            -1.4%      32693        vmstat.system.in
--===============4702253139092002650==--

