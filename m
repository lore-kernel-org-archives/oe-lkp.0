Content-Type: multipart/mixed; boundary="===============4526294324312461897=="
MIME-Version: 1.0
From: Catalin Marinas <catalin.marinas@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm] c566586818: BUG:kernel_hang_in_early-boot_stage, last_printk:Probing_EDD(edd=off_to_disable)...ok
Date: Wed, 26 Aug 2020 18:30:10 +0100
Message-ID: <20200826173010.GD24545@gaia>
In-Reply-To: <9D9FBD8D-DF19-4DA9-B0B1-260BA72D3712@lca.pw>
List-Id: <oe-lkp.lists.linux.dev>

--===============4526294324312461897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 11:02:40PM -0400, Qian Cai wrote:
> On Aug 25, 2020, at 8:44 PM, Rong Chen <rong.a.chen@intel.com> wrote:
> > I rebuilt the kernel on commit c566586818 but the error changed to
> > "RIP: 0010:clear_page_orig+0x12/0x40", and the error can be
> > reproduced on parent commit:
> =

> Catalin, any thought? Sounds like those early kmemleak allocations
> cause some sort of memory corruption?

I can't immediately see how but Rong implies that the error also happens
on the parent commit. Does it mean the bisection isn't entirely right?

-- =

Catalin
--===============4526294324312461897==--

