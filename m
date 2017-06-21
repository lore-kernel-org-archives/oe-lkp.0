Content-Type: multipart/mixed; boundary="===============2672171325949251844=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 13:30:28 -0700
Message-ID: <CA+55aFyupxx0K6SCi5_vd5nt0FmUYrYGF6yB+k9F+9zbgMwsiQ@mail.gmail.com>
In-Reply-To: <20170621202751.GA29638@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2672171325949251844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 1:27 PM, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Now __do_page_fault() tries to expand the stack itself, and this check
> fails.

But we want that check to trigger and cause the access to fail.
Accessing the stack below the stack pointer is wrong.

Do you have a pointer to the report for this regression? I must have missed=
 it.

                Linus

--===============2672171325949251844==--

