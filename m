Content-Type: multipart/mixed; boundary="===============5145465767762012726=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: drivers/iio & kbuild test robot
Date: Wed, 27 Jul 2016 07:35:03 +0800
Message-ID: <20160726233503.GA15811@wfg-t540p.sh.intel.com>
In-Reply-To: <20160726224911.GA16097@d830.WORKGROUP>
List-Id: <oe-lkp.lists.linux.dev>

--===============5145465767762012726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alison,

On Tue, Jul 26, 2016 at 03:49:19PM -0700, Alison Schofield wrote:
>Hi Fengguang,
>
>I recently submitted a patch that adds Kconfig options required
>to build a few drivers in IIO.  The kbuild robot did not find
>these.
>
>You can see the patch here:
>http://git.kernel.org/cgit/linux/kernel/git/jic23/iio.git/commit/?h=3Dfixe=
s-togreg-post-rc1&id=3D9b1425b1698cca01887ad154b631b59666882fb5

What're the error messages look like? That'll help me root cause why
they are missed.

>I'd like to get a general understanding of the build testing the robot
>provides the iio subsystem, and then specifically see if these types of te=
st
>cases can be added.

In general for build tests, 100% coverage is our goal. If any error
is missed, it'd be appreciated to inform us and get the gap closed.

- build error/warnings in all kind of kconfigs
- sparse/coccinelle/smatch static checks
- testing patches posted to mailing lists

You may also opt-in to email notifications triggered by git push, so
that you are aware whether the robot is making good progress for each
pushed branch.

>I'm up for digging into this if you'll point me in the right direction.
>
>First off, I hope this is the correct email list - lkp(a)list.01.org
>I didn't want to get lost in all the robo messages in kbuild-all.

Yeah actually either account will reach us. Yet another one is
lkp(a)intel.com which has internal forward rules to all 0day team
members. Since I do content based filtering, emails not look like
automated reports will be directed to my main mail box.

Thanks,
Fengguang

--===============5145465767762012726==--

