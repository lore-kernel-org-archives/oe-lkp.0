Content-Type: multipart/mixed; boundary="===============8472754124039517630=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [string] 5f6f0801f5: BUG: KASan: out of bounds access in strlcpy+0xc8/0x250 at addr ffff88011a666ee0
Date: Mon, 12 Oct 2015 10:17:14 +0200
Message-ID: <20151012081714.GB23595@gmail.com>
In-Reply-To: <20151012075832.GA8083@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8472754124039517630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Fengguang Wu <fengguang.wu@intel.com> wrote:

> On Mon, Oct 12, 2015 at 03:51:04PM +0800, Fengguang Wu wrote:
> > On Mon, Oct 12, 2015 at 09:33:55AM +0200, Ingo Molnar wrote:
> > > =

> > > * kernel test robot <ying.huang@linux.intel.com> wrote:
> > > =

> > > > FYI, we noticed the below changes on
> > > > =

> > > > git://internal_mailing_list_patch_tree Ingo-Molnar/string-Improve-t=
he-generic-strlcpy-implementation
> > > > commit 5f6f0801f5fdfce4984c6a14f99dbfbb417acb66 ("string: Improve t=
he generic strlcpy() implementation")
> > > =

> > > Hm, there's no such commit ID anywhere I can see - did you rebase my =
tree perhaps?
> > =

> > Ingo, all applied patches will be uploaded to github from now on.

Thanks!

You might want to move that to korg instead, because many people don't like=
 to =

pull from github.

> > Here is the exact commit:
> > =

> > https://github.com/0day-ci/linux/commits/Ingo-Molnar/string-Improve-the=
-generic-strlcpy-implementation
> =

> Sorry that's already the rebased commit.. The old version was applied
> to 4.3-rc4 while the new one is applied to 4.3-rc5.

So as long as you have the tested sha1 mentioned in the bug report, and tha=
t sha1 =

can be pulled from somewhere on korg, I'm a happy camper: in this particula=
r case =

it would have told me whether your testing tree had upstream fix 990486c8af=
 or =

not.

Rebasing and applying email patches for testing purposes is otherwise perfe=
ctly =

OK, as long as the precise Git tree used for testing can be fetched.

Thanks,

	Ingo

--===============8472754124039517630==--

