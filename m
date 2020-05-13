Content-Type: multipart/mixed; boundary="===============4168445191360218546=="
MIME-Version: 1.0
From: Hangbin Liu <liuhangbin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [selftests/bpf] da43712a72: kernel-selftests.bpf.make_fail
Date: Wed, 13 May 2020 17:58:35 +0800
Message-ID: <20200513095835.GD102436@dhcp-12-153.nay.redhat.com>
In-Reply-To: <20200513074418.GE17565@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4168445191360218546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Thanks test bot catch the issue.
On Wed, May 13, 2020 at 03:44:18PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 77bb53cb094828a31cd3c5b402899810f63073c1 ("selftests/bpf: Fix per=
f_buffer test on systems w/ offline CPUs")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git l=
inux-5.4.y

The author for this commit is Andrii(cc'd).

Mine is f1c3656c6d9c ("selftests/bpf: Skip perf hw events test if the setup=
 disabled it")
> prog_tests/stacktrace_build_id_nmi.c:55:3: error: label =E2=80=98cleanup=
=E2=80=99 used but not defined
>    goto cleanup;
>    ^~~~

Hi Greg, we are missing a depend commit
dde53c1b763b ("selftests/bpf: Convert few more selftest to skeletons").

So either we need backport this patch, or if you like, we can also fix it by
changing 'goto cleanup;' to 'goto close_prog;'. So which one do you prefer?

> prog_tests/perf_buffer.c: In function =E2=80=98test_perf_buffer=E2=80=99:
> prog_tests/perf_buffer.c:39:8: warning: implicit declaration of function =
=E2=80=98parse_cpu_mask_file=E2=80=99 [-Wimplicit-function-declaration]
>   err =3D parse_cpu_mask_file("/sys/devices/system/cpu/online",
>         ^~~~~~~~~~~~~~~~~~~

I guess, this is due to the header file path changed.
Hi Andrii, what do you think?

Thanks
Hangbin
--===============4168445191360218546==--

