Content-Type: multipart/mixed; boundary="===============4352974534994676981=="
MIME-Version: 1.0
From: John Wood <john.wood@gmx.com>
To: lkp@lists.01.org
Subject: Re: [security/brute] cfe92ab6a3: WARNING:inconsistent_lock_state
Date: Tue, 02 Mar 2021 19:39:20 +0100
Message-ID: <20210302183920.GB3049@ubuntu>
In-Reply-To: <20210302054941.GA23892@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4352974534994676981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 01:49:41PM +0800, kernel test robot wrote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: cfe92ab6a3ea700c08ba673b46822d51f38d6b40 ("[PATCH v5 2/8] securit=
y/brute: Define a LSM and manage statistical data")
> url: https://github.com/0day-ci/linux/commits/John-Wood/Fork-brute-force-=
attack-mitigation/20210228-022911
> base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.=
git next
>
> in testcase: trinity
> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> with following parameters:
>
> 	group: ["group-00", "group-01", "group-02", "group-03", "group-04"]
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------------------------------------=
-+------------+------------+
> |                                                                        =
 | 1d53b7aac6 | cfe92ab6a3 |
> +------------------------------------------------------------------------=
-+------------+------------+
> | WARNING:inconsistent_lock_state                                        =
 | 0          | 6          |
> | inconsistent{IN-SOFTIRQ-W}->{SOFTIRQ-ON-W}usage                        =
 | 0          | 6          |
> +------------------------------------------------------------------------=
-+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [  116.852721] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  116.853120] WARNING: inconsistent lock state
> [  116.853120] 5.11.0-rc7-00013-gcfe92ab6a3ea #1 Tainted: G S
> [  116.853120] --------------------------------
>
> [...]

Thanks for the report. I will work on this for the next version.

> Thanks,
> Oliver Sang

Thanks,
John Wood
--===============4352974534994676981==--

