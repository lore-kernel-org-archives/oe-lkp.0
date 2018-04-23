Content-Type: multipart/mixed; boundary="===============5403346957523917825=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bpf] 4f7b25baf0: kernel_selftests.bpf.test_maps.fail
Date: Mon, 23 Apr 2018 11:41:34 +0200
Message-ID: <8383eefc-2370-5397-3fa5-510cee9d527e@iogearbox.net>
In-Reply-To: <20180423063250.GO5563@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5403346957523917825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/23/2018 08:32 AM, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 4f7b25baf0cefa88aa267e8ff60150c4ac1479ef ("bpf: sockmap, refactor=
 sockmap routines to work with hashmap")
> url: https://github.com/0day-ci/linux/commits/John-Fastabend/bpf-sockmap-=
free-memory-on-sock-close-with-cork-data/20180401-230416
> base: https://git.kernel.org/cgit/linux/kernel/git/bpf/bpf-next.git master

(fyi, refers to https://patchwork.ozlabs.org/patch/894017/ which is not in =
tree.)

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-00
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m 5G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> selftests: test_maps
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Failed allowed duplicate programs in update ANY sockmap 0 '4:8'
> not ok 1..3 selftests:  test_maps [FAIL]
> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> Xiaolong
> =



--===============5403346957523917825==--

