Content-Type: multipart/mixed; boundary="===============7338243431557673056=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fanotify] a8b98c808e: stress-ng.fanotify.ops_per_sec 32.2% improvement
Date: Thu, 03 Jun 2021 10:43:24 +0200
Message-ID: <20210603084324.GC23647@quack2.suse.cz>
In-Reply-To: <CAOQ4uxjdtfriARxh_CiTxFi8=T6j065HtbJGnuAas7oyPNADKg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7338243431557673056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 03-06-21 09:57:15, Amir Goldstein wrote:
> On Thu, Jun 3, 2021 at 4:36 AM kernel test robot <oliver.sang@intel.com=
> wrote:
> >
> >
> >
> > Greeting,
> >
> > FYI, we noticed a 32.2% improvement of stress-ng.fanotify.ops_per_sec d=
ue to commit:
> >
> >
> > commit: a8b98c808eab3ec8f1b5a64be967b0f4af4cae43 ("fanotify: fix permis=
sion model of unprivileged group")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> =

> I guess now we know what caused the reported regression:
> https://lore.kernel.org/lkml/20210511124632.GL24154(a)quack2.suse.cz/
> =

> I didn't know that capable() is so significant.

Yeah, I wouldn't guess either. Interesting.

								Honza

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============7338243431557673056==--

