Content-Type: multipart/mixed; boundary="===============2812389622769620974=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d28296d248: stress-ng.sigsegv.ops_per_sec -82.7% regression
Date: Wed, 24 Feb 2021 11:10:43 -0800
Message-ID: <CAHk-=wh3wVpx97e=n2D98W+PSDWUkQrX3O+c7n7MGRbn_k9JMg@mail.gmail.com>
In-Reply-To: <20210224183828.j6uut6sholeo2fzh@example.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2812389622769620974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 10:38 AM Alexey Gladkov
<gladkov.alexey@gmail.com> wrote:
>
> One of the reasons for this is that I rolled back the patch that changed
> the ucounts.count type to atomic_t. Now get_ucounts() is forced to use a
> spin_lock to increase the reference count.

Yeah, that definitely should be an atomic type, since the extended use
of ucounts clearly puts way too much pressure on that ucount lock.

I remember complaining about one version of that patch, but my
complaint wasabout it changing semantics of the saturation logic (and
I think it was also wrong because it still kept the spinlock for
get_ucounts(), so it didn't even take advantage of the atomic
refcount).

Side note: I don't think a refcount_t" is necessarily the right thing
to do, since the ucount reference counter does its own saturation
logic, and the refcount_t version is imho not great.

So it probably just needs to use an atomic_t, and do the saturation
thing manually.

Side note: look at try_get_page(). That one actually does refcounting
with overflow protection better than refcount_t, in my opinion. But I
am obviously biased, since I wrote it ;)

See commits

    88b1a17dfc3e mm: add 'try_get_page()' helper function
    f958d7b528b1 mm: make page ref count overflow check tighter and
more explicit

with that "page->_recount" being just a regular atomic_t.

            Linus
--===============2812389622769620974==--

