Content-Type: multipart/mixed; boundary="===============7190853517107060818=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 22:56:17 +0200
Message-ID: <20170621205617.GA29841@redhat.com>
In-Reply-To: <CA+55aFyupxx0K6SCi5_vd5nt0FmUYrYGF6yB+k9F+9zbgMwsiQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7190853517107060818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/21, Linus Torvalds wrote:
>
> On Wed, Jun 21, 2017 at 1:27 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > Now __do_page_fault() tries to expand the stack itself, and this check
> > fails.
>
> But we want that check to trigger and cause the access to fail.
> Accessing the stack below the stack pointer is wrong.

I understand. My point is that this check was invalidated by stack-guard-pa=
ge
a long ago, and this means that we add the user-visible change now.

> Do you have a pointer to the report for this regression? I must have miss=
ed it.

See http://marc.info/?t=3D149794523000001&r=3D1&w=3D2

this thread is a bit confusing, the most relevant emails are

	http://marc.info/?l=3Dlinux-kernel&m=3D149806256621440&w=3D2 (with test ca=
se)
	http://marc.info/?l=3Dlinux-kernel&m=3D149806452322233&w=3D2

Actually, I got another (redhat internal) bug report after this discussion,
and at first glance this is the same thing.

Just in case, I agree that mmap(MAP_GROWSDOWN) is mostly useless, perhaps
we do not even care. But still this is regression.

Oleg.


--===============7190853517107060818==--

