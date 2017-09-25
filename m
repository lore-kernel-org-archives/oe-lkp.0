Content-Type: multipart/mixed; boundary="===============9095839944109738783=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: 9f4835fb96 ("x86/fpu: Tighten validation of user-supplied .."): Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Mon, 25 Sep 2017 16:55:09 +0200
Message-ID: <20170925145509.py4prxskkbpqfjsd@gmail.com>
In-Reply-To: <20170925131033.2mvlrspgvti5tpbj@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9095839944109738783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Fengguang Wu <wfg@linux.intel.com> wrote:

> On Mon, Sep 25, 2017 at 10:20:13AM +0800, kernel test robot wrote:
> > Hi Ingo,
> > =

> > On your request I'm resending the report here, with attached dmesg,
> > kconfig and reproduce script.
> > =

> > I'll go on to test your split up commits, too.
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/fpu
> =

> It looks 6fc19a42 ("x86/fpu: Use validate_xstate_header() to validate
> the xstate_header in sanitize_restored_xstate()") is the first bad commit.

Thank you! Could you check that the latest tip:master or tip:WIP.x86/fpu =

(9cff7344187e) fixes this crash?

Thanks,

	Ingo

--===============9095839944109738783==--

