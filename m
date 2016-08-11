Content-Type: multipart/mixed; boundary="===============5724623152592629364=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 23:16:35 +0100
Message-ID: <20160811221634.GU2356@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFwPqsxBquvAdgvEgE+stgvMi4ecw26zP7Q1Xi3N6fCRwQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5724623152592629364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 01:35:00PM -0700, Linus Torvalds wrote:

> The thing is, iov_iter_copy_from_user_atomic() doesn't itself enforce
> non-blocking user accesses, it depends on the caller blocking page
> faults.

Huh?  The very first thing it does is
        char *kaddr =3D kmap_atomic(page), *p =3D kaddr + offset;

If _that_ does not disable pagefaults, we are very deep in shit.  AFAICS,
all instances of that sucker do disable those, including the non-highmem
default (it's
static inline void *kmap_atomic(struct page *page)
{
        preempt_disable();
        pagefault_disable();
        return page_address(page);
}
)

--===============5724623152592629364==--

