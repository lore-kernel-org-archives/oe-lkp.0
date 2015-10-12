Content-Type: multipart/mixed; boundary="===============1045830139060993826=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [string] 5f6f0801f5: BUG: KASan: out of bounds access in strlcpy+0xc8/0x250 at addr ffff88011a666ee0
Date: Mon, 12 Oct 2015 15:58:32 +0800
Message-ID: <20151012075832.GA8083@wfg-t540p.sh.intel.com>
In-Reply-To: <20151012075104.GB5518@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1045830139060993826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2015 at 03:51:04PM +0800, Fengguang Wu wrote:
> On Mon, Oct 12, 2015 at 09:33:55AM +0200, Ingo Molnar wrote:
> > =

> > * kernel test robot <ying.huang@linux.intel.com> wrote:
> > =

> > > FYI, we noticed the below changes on
> > > =

> > > git://internal_mailing_list_patch_tree Ingo-Molnar/string-Improve-the=
-generic-strlcpy-implementation
> > > commit 5f6f0801f5fdfce4984c6a14f99dbfbb417acb66 ("string: Improve the=
 generic strlcpy() implementation")
> > =

> > Hm, there's no such commit ID anywhere I can see - did you rebase my tr=
ee perhaps?
> =

> Ingo, all applied patches will be uploaded to github from now on.
> =

> Here is the exact commit:
> =

> https://github.com/0day-ci/linux/commits/Ingo-Molnar/string-Improve-the-g=
eneric-strlcpy-implementation

Sorry that's already the rebased commit.. The old version was applied
to 4.3-rc4 while the new one is applied to 4.3-rc5.

Thanks,
Fengguang

--===============1045830139060993826==--

