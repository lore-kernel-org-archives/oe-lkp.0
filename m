Content-Type: multipart/mixed; boundary="===============5020155400105841524=="
MIME-Version: 1.0
From: Cristian Marussi <cristian.marussi@arm.com>
To: lkp@lists.01.org
Subject: Re: [selftests/kselftest/runner.sh] 3226b4a464: kernel-selftests.cpu-hotplug.cpu-on-off-test.sh.fail
Date: Wed, 15 Dec 2021 09:59:11 +0000
Message-ID: <20211215095911.GK6207@e120937-lin>
In-Reply-To: <20211213052044.GA1334@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5020155400105841524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 01:20:44PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =


Hi,

> commit: 3226b4a4648c6562c642947cee8b90335df911f5 ("[PATCH] selftests/ksel=
ftest/runner.sh: Add optional command parameters in settings")
> url: https://github.com/0day-ci/linux/commits/Cristian-Marussi/selftests-=
kselftest-runner-sh-Add-optional-command-parameters-in-settings/20211202-22=
2205
> base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.=
git next
> patch link: https://lore.kernel.org/linux-kselftest/20211202142056.17386-=
1-cristian.marussi(a)arm.com
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-99d09ee9-1_20211206
> with following parameters:
> =

> 	group: group-01
> 	ucode: 0xde
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =


This commit was under discussion/not acked nor fully reviewed, not ready
for upstream queuing really.

Indeed I posted today a V2 that take a different approach:

https://lore.kernel.org/linux-kselftest/20211215095340.50717-1-cristian.mar=
ussi(a)arm.com/T/#u

and should solve also the issue mentioned in this report.

Thanks,
Cristian

--===============5020155400105841524==--

