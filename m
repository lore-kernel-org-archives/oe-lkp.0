Content-Type: multipart/mixed; boundary="===============6204800338045185517=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fanotify] 7cea2a3c50: stress-ng.fanotify.ops_per_sec -23.4% regression
Date: Tue, 11 May 2021 14:46:32 +0200
Message-ID: <20210511124632.GL24154@quack2.suse.cz>
In-Reply-To: <CAOQ4uxhoR8h0Mw=LJGSxMYWC1krjbwgzxbYNDjMmeo3sBAey1w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6204800338045185517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 11-05-21 14:13:38, Amir Goldstein wrote:
> On Tue, May 11, 2021 at 9:51 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> >
> >
> > Greeting,
> >
> > FYI, we noticed a -23.4% regression of stress-ng.fanotify.ops_per_sec d=
ue to commit:
> >
> >
> > commit: 7cea2a3c505e87a9d6afc78be4a7f7be636a73a7 ("fanotify: support li=
mited functionality for unprivileged users")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> =

> I am not sure how this is possible.
> This commit only changes permissions to perform the operation.
> Is the test not being run as root?

Yeah, I've stared at it for some time and didn't come up with a sensible
explanation either. I guess we need to try to reproduce and see...

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============6204800338045185517==--

