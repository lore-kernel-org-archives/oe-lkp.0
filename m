Content-Type: multipart/mixed; boundary="===============3605844732796933809=="
MIME-Version: 1.0
From: Stephen Boyd <sboyd@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clk] a2499eff4b: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 18 Aug 2020 20:13:33 -0700
Message-ID: <159780681339.334488.10402512224012716827@swboyd.mtv.corp.google.com>
In-Reply-To: <20200811084943.GC7488@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3605844732796933809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting kernel test robot (2020-08-11 01:49:44)
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: a2499eff4b30a85d56e4466e6ca4746c72a347c6 ("[PATCH v2] clk: samsun=
g: Keep top BPLL mux on Exynos542x enabled")
> url: https://github.com/0day-ci/linux/commits/Marek-Szyprowski/clk-samsun=
g-Keep-top-BPLL-mux-on-Exynos542x-enabled/20200807-213239
> base: https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git clk-next
> =

> in testcase: trinity
> with following parameters:
> =

>         runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G

Cool robot. But this doesn't look related to the patch at all?
--===============3605844732796933809==--

