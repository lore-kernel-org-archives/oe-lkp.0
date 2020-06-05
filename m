Content-Type: multipart/mixed; boundary="===============5363174811690734222=="
MIME-Version: 1.0
From: Stefano Brivio <sbrivio@redhat.com>
To: lkp@lists.01.org
Subject: Re: [netfilter] e32a4dc651: BUG:using_smp_processor_id()in_preemptible
Date: Fri, 05 Jun 2020 02:25:41 +0200
Message-ID: <20200605022541.3d702fe1@redhat.com>
In-Reply-To: <7dd4f0d2-34a7-8086-99cb-424ff2e039ca@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5363174811690734222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Jun 2020 08:15:07 +0800
Liu Yiding <yidingx.liu@intel.com> wrote:

> Hi,
> =

> On 6/5/20 6:23 AM, Stefano Brivio wrote:
> > Hi,
> >
> > On Wed, 3 Jun 2020 16:49:34 +0800
> > kernel test robot <lkp@intel.com> wrote:
> >  =

> >> Greeting,
> >>
> >> FYI, we noticed the following commit (built with gcc-7):
> >>
> >> commit: e32a4dc6512ce3c1a1920531246e7037896e510a ("netfilter: nf_table=
s: make sets built-in")
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >>
> >> in testcase: kernel-selftests
> >> with following parameters:
> >>
> >> 	group: kselftests-netfilter  =

> > I couldn't find this information in the report. Would it be possible to
> > have here an indication of what kselftest specifically is failing?
> > There are a number of tests in that group. I have an obvious suspicion
> > here (nft_concat_range.sh), but it would be nice to know, in general.  =

> =

> Yes, it's nft_concat_range.sh caused this error.
> =

> ```
> =

> [=C2=A0 165.249447] # selftests: netfilter: nft_concat_range.sh
> [=C2=A0 165.249453]
> [=C2=A0 165.295336] # TEST: reported issues
> [=C2=A0 165.295342]
> [=C2=A0 165.316525] BUG: using smp_processor_id() in preemptible [0000000=
0] =

> code: nft/6247
> [=C2=A0 165.319547] caller is nft_pipapo_insert+0x464/0x610 [nf_tables]
> [=C2=A0 165.321846] CPU: 1 PID: 6247 Comm: nft Not tainted =

> 5.6.0-rc5-01595-ge32a4dc6512ce3 #1
> =

> ```

Thanks for confirming. I think it would really be helpful to have the
specific test name in the report, in the future.

> And i think this error is caused by some kconfigs.
>
> This test was passed until we enabled all kconfigs defined in =

> netfilter/config. :-(

Then most likely this was CONFIG_NF_TABLES_SET not enabled, which goes
away with Florian's commit e32a4dc6512c as the whole feature is now
built in.

-- =

Stefano

--===============5363174811690734222==--

