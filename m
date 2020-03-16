Content-Type: multipart/mixed; boundary="===============8050915848343188405=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Mon, 16 Mar 2020 15:26:31 +1100
Message-ID: <87sgi9rklk.fsf@notabene.neil.brown.name>
In-Reply-To: <CAHk-=whYQqtW6B7oPmPr9-PXwyqUneF4sSFE+o3=7QcENstE-g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8050915848343188405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14 2020, Linus Torvalds wrote:

> On Fri, Mar 13, 2020 at 7:31 PM NeilBrown <neilb@suse.de> wrote:
>>
>> The idea of list_del_init_release() and list_empty_acquire() is growing
>> on me though.  See below.
>
> This does look like a promising approach.

Thanks.

>
> However:
>
>> +       if (waiter->fl_blocker =3D=3D NULL &&
>> +           list_empty(&waiter->fl_blocked_requests) &&
>> +           list_empty_acquire(&waiter->fl_blocked_member))
>> +               return status;
>
> This does not seem sensible to me.
>
> The thing is, the whole point about "acquire" semantics is that it
> should happen _first_ - because a load-with-acquire only orders things
> _after_ it.

Agreed.

>
> So testing some other non-locked state before testing the load-acquire
> state makes little sense: it means that the other tests you do are
> fundamentally unordered and nonsensical in an unlocked model.
>
> So _if_ those other tests matter (do they?), then they should be after
> the acquire test (because they test things that on the writer side are
> set before the "store-release"). Otherwise you're testing random
> state.
>
> And if they don't matter, then they shouldn't exist at all.

The ->fl_blocker =3D=3D NULL test isn't needed. It is effectively equivalent
to the list_empty(fl_blocked_member) test.

The fl_blocked_requests test *is* needed (because a tree is dismantled
from the root to the leaves, so it stops being a member while it still
holds other requests).  I didn't think the ordering mattered all that
much but having pondered it again I see that it does.

>
> IOW, if you depend on ordering, then the _only_ ordering that exists is:
>
>  - writer side: writes done _before_ the smp_store_release() are visible
>
>  - to the reader side done _after_ the smp_load_acquire()
>
> and absolutely no other ordering exists or makes sense to test for.
>
> That limited ordering guarantee is why a store-release -> load-acquire
> is fundamentally cheaper than any other serialization.
>
> So the optimistic "I don't need to do anything" case should start ouf with
>
>         if (list_empty_acquire(&waiter->fl_blocked_member)) {
>
> and go from there. Does it actually need to do anything else at all?
> But if it does need to check the other fields, they should be checked
> after that acquire.

So it should be
   if (list_empty_acquire(&wait->fl_blocked_member) &&
       list_empty_acquire(&wait->fl_blocked_requests))
           return status;

And because that second list_empty_acquire() is on the list head, and
pairs with a list_del_init_release() on a list member, I would need to
fix the __list_del() part to be
  next->prev =3D prev;
  smp_store_release(prev->next, next)

>
> Also, it worries me that the comment talks about "if fl_blocker is
> NULL". But it realy now is that fl_blocked_member list being empty
> that is the real serialization test, adn that's the one that the
> comment should primarily talk about.

Yes, I see that now.  Thanks.

NeilBrown

--===============8050915848343188405==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1dS8vZ0FDZ2tRT2V5ZTNWWmkKZ2JucTF3LytJU0Z5Y2lxdlBx
V1MxQXg2NGdzV1BYWjYrbGtzUmVtOG44RzNLMnhCcUpiRjFZOTV0WFJWK201agpoVHd4UmdOTEp4
c2tDOHJoOVJqMklha2x4SHFYYXRWTmJZcXBxY3ZyOE5qSklpMEh5TXRqNDZiakRmbFNla2kzCnZO
SjFmRUhFRnlFNFlhdUhjY3FNaVVDOHBLYXQzbldjN2ZIalpETzZMS3ArRzROUk5YQkxHSGxZb0tZ
RUNvbXAKSFpCL1d2Vlp1OGovR0twL3RidDVmN1d5WWI3SFl5VU5qeXRxUWxGMVQ2Qm9wd000N2Fo
OGM1QkJHazczWmRRdApPRFRISFoxb2hsOW1mczFBUGJKWGwvTEt0OEpQM0xxTUhuL0pvRC9vK1dN
MmhQRkl2akRqT0xrNGQ2K3pjOU9KCnVmNWIzUGh1WXQ2d1ljZHlONFNEVlBjY3pMME55T0pCODRM
QlcrQkNnVTROR2FHaUw5QmNEUHZlZ081YnQ4ZG8KSlhmVDE4RFZaRmhGVUd2dzhJSDRKNkRIbFNa
VnJIK3lKd2FoQkYyVW52ZWk5SW5WV0JYWC9vY1ZpNWlsT0tXeAo4cWdiclJETnVVWGlvamlTSmNh
UjIraDkwTFVGM1psWTJiYnVNMjN6SzhUbHByUXdQMnVEcjlhUlRZVWlhT1RFCmkwOWpuRXRyd2dE
KytQMmtlTm9UUkFMMVZjRE02Nlo1WnladHd3QTRmNlptb1J4RTlNQ2ZCcStoSk5iODFNS0IKTWJk
ajIvZkgxdjdyWE1xZ09XN1lHWkswT2lqY1B1NDArcVp4N0IxVWJnVndTMlNnRFBUZmJ0WE5veW14
K1NHQgpibWR4K2RmbnZWSDB3eFpLS2RIV2xObDBVMWRGKzVkTkR6RUhKWlR0VExwM2puYkU0cGs9
Cj03bGo4Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============8050915848343188405==--

