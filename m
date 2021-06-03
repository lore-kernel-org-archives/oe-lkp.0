Content-Type: multipart/mixed; boundary="===============8486416639907810437=="
MIME-Version: 1.0
From: Matthew Bobrowski <repnop@google.com>
To: lkp@lists.01.org
Subject: Re: [fanotify] a8b98c808e: stress-ng.fanotify.ops_per_sec 32.2% improvement
Date: Fri, 04 Jun 2021 07:56:18 +1000
Message-ID: <YLlQAqlUxEt4eTiR@google.com>
In-Reply-To: <20210603084324.GC23647@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8486416639907810437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 10:43:24AM +0200, Jan Kara wrote:
> On Thu 03-06-21 09:57:15, Amir Goldstein wrote:
> > On Thu, Jun 3, 2021 at 4:36 AM kernel test robot <oliver.sang@intel.c=
om> wro
> > > Greeting,
> > >
> > > FYI, we noticed a 32.2% improvement of stress-ng.fanotify.ops_per_sec=
 due to commit:
> > >
> > >
> > > commit: a8b98c808eab3ec8f1b5a64be967b0f4af4cae43 ("fanotify: fix perm=
ission model of unprivileged group")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > >
> > >
> > =

> > I guess now we know what caused the reported regression:
> > https://lore.kernel.org/lkml/20210511124632.GL24154(a)quack2.suse.cz/
> > =

> > I didn't know that capable() is so significant.
> =

> Yeah, I wouldn't guess either. Interesting.

Indeed, interesting! :)

While on the topic of stress-ng, it reminds me to set this up on my server
so we can perform such regressions before merging fanotify changes into
master.

/M
--===============8486416639907810437==--

