Content-Type: multipart/mixed; boundary="===============5376886247329334790=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Sat, 14 Mar 2020 08:58:04 -0700
Message-ID: <CAHk-=whYQqtW6B7oPmPr9-PXwyqUneF4sSFE+o3=7QcENstE-g@mail.gmail.com>
In-Reply-To: <877dznu0pk.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============5376886247329334790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 7:31 PM NeilBrown <neilb@suse.de> wrote:
>
> The idea of list_del_init_release() and list_empty_acquire() is growing
> on me though.  See below.

This does look like a promising approach.

However:

> +       if (waiter->fl_blocker =3D=3D NULL &&
> +           list_empty(&waiter->fl_blocked_requests) &&
> +           list_empty_acquire(&waiter->fl_blocked_member))
> +               return status;

This does not seem sensible to me.

The thing is, the whole point about "acquire" semantics is that it
should happen _first_ - because a load-with-acquire only orders things
_after_ it.

So testing some other non-locked state before testing the load-acquire
state makes little sense: it means that the other tests you do are
fundamentally unordered and nonsensical in an unlocked model.

So _if_ those other tests matter (do they?), then they should be after
the acquire test (because they test things that on the writer side are
set before the "store-release"). Otherwise you're testing random
state.

And if they don't matter, then they shouldn't exist at all.

IOW, if you depend on ordering, then the _only_ ordering that exists is:

 - writer side: writes done _before_ the smp_store_release() are visible

 - to the reader side done _after_ the smp_load_acquire()

and absolutely no other ordering exists or makes sense to test for.

That limited ordering guarantee is why a store-release -> load-acquire
is fundamentally cheaper than any other serialization.

So the optimistic "I don't need to do anything" case should start ouf with

        if (list_empty_acquire(&waiter->fl_blocked_member)) {

and go from there. Does it actually need to do anything else at all?
But if it does need to check the other fields, they should be checked
after that acquire.

Also, it worries me that the comment talks about "if fl_blocker is
NULL". But it realy now is that fl_blocked_member list being empty
that is the real serialization test, adn that's the one that the
comment should primarily talk about.

                Linus
--===============5376886247329334790==--

