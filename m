Content-Type: multipart/mixed; boundary="===============2231989292888764467=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] fsnotify: fix unlink performance regression
Date: Mon, 13 May 2019 18:23:57 +0200
Message-ID: <20190513162357.GD13297@quack2.suse.cz>
In-Reply-To: <CAOQ4uxiE=32a5RhqVyC9YAwoxfAdjLjAH0dgSEEV_EaT7H25UQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2231989292888764467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 10-05-19 17:57:49, Amir Goldstein wrote:
> On Thu, May 9, 2019 at 12:46 PM Jan Kara <jack@suse.cz> wrote:
> >
> > On Tue 07-05-19 22:12:57, Amir Goldstein wrote:
> > > On Tue, May 7, 2019 at 7:19 PM Jan Kara <jack@suse.cz> wrote:
> > > > So I'd rather move the fsnotify call to vfs_unlink(),
> > > > vfs_rmdir(), simple_unlink(), simple_rmdir(), and then those few ca=
llers of
> > > > d_delete() that remain as you suggest elsewhere in this thread. And=
 then we
> > > > get more consistent context for fsnotify_nameremove() and could jus=
t use
> > > > fsnotify_dirent().
> > > >
> > >
> > > Yes, I much prefer this solution myself and I will follow up with it,
> > > but it would not be honest to suggest said solution as a stable fix
> > > to the performance regression that was introduced in v5.1.
> > > I think is it better if you choose between lesser evil:
> > > v1 with ifdef CONFIG_FSNOTIFY to fix build issue
> > > v2 as subtle as it is
> > > OR another obviously safe stable fix that you can think of
> >
> > OK, fair enough. I'll go with v1 + build fix for current merge window +
> > stable as it's local to fsnotify_nameremove().
> =

> Please note that the patch on your fsnotify branch conflicts with
> fsnotify_nameremove() changes in master:
> 230c6402b1b3 ovl_lookup_real_one(): don't bother with strlen()
> 25b229dff4ff fsnotify(): switch to passing const struct qstr * for file_n=
ame

Thanks for the heads up! The conflict is easy enough to resolve but I've
notified Linus about it in my pull request. Hum, which reminds me that I've
forgotten to pull the latest fix in fsnotify branch into my for_next branch
and so I didn't get a notification about the conflict myself. Too late to
fix that now I guess...

								Honza

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============2231989292888764467==--

