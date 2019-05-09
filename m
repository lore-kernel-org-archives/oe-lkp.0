Content-Type: multipart/mixed; boundary="===============1106019378358376028=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] fsnotify: fix unlink performance regression
Date: Thu, 09 May 2019 11:46:29 +0200
Message-ID: <20190509094629.GB23589@quack2.suse.cz>
In-Reply-To: <CAOQ4uxgHgSiNGqozbR-pqF0BU7J-R51wXUwT_fDUnYbix3kGXw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1106019378358376028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 07-05-19 22:12:57, Amir Goldstein wrote:
> On Tue, May 7, 2019 at 7:19 PM Jan Kara <jack@suse.cz> wrote:
> > So I'd rather move the fsnotify call to vfs_unlink(),
> > vfs_rmdir(), simple_unlink(), simple_rmdir(), and then those few caller=
s of
> > d_delete() that remain as you suggest elsewhere in this thread. And the=
n we
> > get more consistent context for fsnotify_nameremove() and could just use
> > fsnotify_dirent().
> >
> =

> Yes, I much prefer this solution myself and I will follow up with it,
> but it would not be honest to suggest said solution as a stable fix
> to the performance regression that was introduced in v5.1.
> I think is it better if you choose between lesser evil:
> v1 with ifdef CONFIG_FSNOTIFY to fix build issue
> v2 as subtle as it is
> OR another obviously safe stable fix that you can think of

OK, fair enough. I'll go with v1 + build fix for current merge window +
stable as it's local to fsnotify_nameremove().

> The change of cleansing d_delete() from fsnotify_nameremove()
> requires more research and is anyway not stable tree material -
> if not for the level of complexity, then because all the users of
> FS_DELETE from pseudo and clustered filesystems need more time
> to find regressions (we do not have test coverage for those in LTP).

Agreed.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============1106019378358376028==--

