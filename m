Content-Type: multipart/mixed; boundary="===============6110489781909340346=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [perf script] 4140d2ea74: perf-sanity-tests.probe_libc's_inet_pton_&_backtrace_it_with_ping.fail
Date: Thu, 28 Jun 2018 11:38:36 +0800
Message-ID: <99b6f860-22f8-63ff-8576-d3be7f0390f1@intel.com>
In-Reply-To: <20180520023049.GB19767@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6110489781909340346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sandipan Das

after this patch, the failure details under ubuntu and debian are like:

lizhijian(a)haswell-OptiPlex-9020:~/lkp/linux/tools/perf$ sudo ./perf test =
ping -v
63: probe libc's inet_pton & backtrace it with ping       :
--- start ---
test child forked, pid 4207
ping 4224 [007] 3034121.295510: probe_libc:inet_pton: (7fedfccb2200)
7fedfccb2200 __GI___inet_pton+0x0 (/lib/x86_64-linux-gnu/libc-2.23.so)
7fedfcc7ad5e getaddrinfo+0xee (/lib/x86_64-linux-gnu/libc-2.23.so)
55e3239a9f4d [unknown] (/bin/ping)
FAIL: expected backtrace entry 3 ".*\+0x[[:xdigit:]]+[[:space:]]\(.*/bin/pi=
ng.*\)$" got "55e3239a9f4d [unknown] (/bin/ping)"
test child finished with -1
---- end ----
probe libc's inet_pton & backtrace it with ping: FAILED!


Can we also expect "[unknown]" for ping command like below:

lizhijian(a)haswell-OptiPlex-9020:~/lkp/linux/tools/perf$ git diff
diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/=
perf/tests/shell/record+probe_libc_inet_pton.sh
index 2630570..284a261 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -27,7 +27,7 @@ trace_libc_inet_pton_backtrace() {
         *)
                 eventattr=3D'max-stack=3D3'
                 expected[2]=3D"getaddrinfo\+0x[[:xdigit:]]+[[:space:]]\($l=
ibc\)$"
-               expected[3]=3D".*\+0x[[:xdigit:]]+[[:space:]]\(.*/bin/ping.=
*\)$"
+               expected[3]=3D".*(\+0x[[:xdigit:]]|\[unknown\])+[[:space:]]=
\(.*/bin/ping.*\)$"
                 ;;
         esac


Thanks

On 5/20/2018 10:30 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 4140d2ea74b39d5a384cef505ca3aed9c8838505 ("perf script: Show symb=
ol offsets by default")
> https://git.kernel.org/cgit/linux/kernel/git/acme/linux.git perf/core
>
> in testcase: perf-sanity-tests
> with following parameters:
>
> 	perf_compiler: gcc
>
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu kvm64,+ssse3 -smp 2 =
-m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> 62: probe libc's inet_pton & backtrace it with ping       : FAILED!
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
>
>
>
> Thanks,
> Xiaolong
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============6110489781909340346==--

