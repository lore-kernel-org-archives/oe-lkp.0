Content-Type: multipart/mixed; boundary="===============9046164146564632597=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Thu, 12 Oct 2017 21:19:01 +0200
Message-ID: <CAMuHMdWmp5cJf82d_V8=Kzii9r6oFpDMGitBsLRUMNW2HmZxog@mail.gmail.com>
In-Reply-To: <20171012114843.d74096014cb88eedbaa7ac70@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9046164146564632597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 8:48 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Thu, 12 Oct 2017 10:54:57 -0700 Linus Torvalds <torvalds@linux-found=
ation.org> wrote:
>> On Thu, Oct 12, 2017 at 10:05 AM, Christopher Lameter <cl@linux.com> w=
rote:
>> > On Wed, 11 Oct 2017, Josh Poimboeuf wrote:
>> >
>> >> I failed to add the slab maintainers to CC on the last attempt.  Tryi=
ng
>> >> again.
>> >
>> > Hmmm... Yea. SLOB is rarely used and tested. Good illustration of a si=
mple
>> > allocator and the K&R mechanism that was used in the early kernels.
>>
>> Should we finally just get rid of SLOB?
>>
>> I'm not happy about the whole "three different allocators" crap. It's
>> been there for much too long, and I've tried to cut it down before.
>> People always protest, but three different allocators, one of which
>> gets basically no testing, is not good.
>
> I am not aware of anyone using slob.  We could disable it in Kconfig
> for a year, see what the feedback looks like.

$ git grep CONFIG_SLOB=3Dy
arch/arm/configs/clps711x_defconfig:CONFIG_SLOB=3Dy
arch/arm/configs/collie_defconfig:CONFIG_SLOB=3Dy
arch/arm/configs/multi_v4t_defconfig:CONFIG_SLOB=3Dy
arch/arm/configs/omap1_defconfig:CONFIG_SLOB=3Dy
arch/arm/configs/pxa_defconfig:CONFIG_SLOB=3Dy
arch/arm/configs/tct_hammer_defconfig:CONFIG_SLOB=3Dy
arch/arm/configs/xcep_defconfig:CONFIG_SLOB=3Dy
arch/blackfin/configs/DNP5370_defconfig:CONFIG_SLOB=3Dy
arch/h8300/configs/edosk2674_defconfig:CONFIG_SLOB=3Dy
arch/h8300/configs/h8300h-sim_defconfig:CONFIG_SLOB=3Dy
arch/h8300/configs/h8s-sim_defconfig:CONFIG_SLOB=3Dy
arch/openrisc/configs/or1ksim_defconfig:CONFIG_SLOB=3Dy
arch/sh/configs/rsk7201_defconfig:CONFIG_SLOB=3Dy
arch/sh/configs/rsk7203_defconfig:CONFIG_SLOB=3Dy
arch/sh/configs/se7206_defconfig:CONFIG_SLOB=3Dy
arch/sh/configs/shmin_defconfig:CONFIG_SLOB=3Dy
arch/sh/configs/shx3_defconfig:CONFIG_SLOB=3Dy
kernel/configs/tiny.config:CONFIG_SLOB=3Dy
$

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

--===============9046164146564632597==--

