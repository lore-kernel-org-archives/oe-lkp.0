Content-Type: multipart/mixed; boundary="===============4097648738328683875=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d4252071b9: fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec -26.5% regression
Date: Wed, 31 Aug 2022 09:46:12 -0700
Message-ID: <CAHk-=wgG=mttS-m2OLcnsTwia2roHR2b-DxXXG-tbDH8_cUNiA@mail.gmail.com>
In-Reply-To: <Yw8L7HTZ/dE2/o9C@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4097648738328683875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2022 at 12:21 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
> hi, pleased be noted that we read this patch and understand it as a fix,
> also what we understand is, since the patch itself adds some memory barri=
er,
> some regression in block IO area is kind of expected.

Well, yes and no.

It's a memory ordering fix, but the memory ordering part is one that
should *not* have any actual impact on x86, because the addition of
smp_mb__before_atomic() should be a total no-op, and
"smp_load_acquire()" should only imply a compiler scheduling barrier.

IOW, it most definitely shouldn't cause something like this:

 > FYI, we noticed a -26.5% regression of
 >  fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec

because at most it should have caused tiny perturbation of the
instruction scheduling (obviously possibly register allocation, stack
spill differences and and instruction choice).

Except there was a change there that isn't just about memory ordering:

> after more internal review, we still decided to report out to share our f=
inding
> in our tests, and for your information that how this patch could impact
> performance in some cases. please let us know if you have any concern.

Oh, it's absolutely interesting and unexpected.

And I think the cause is obvious: our "set_buffer_uptodate()" *used*
to use the BUFFER_FNS() macro, which does that bit setting
conditionally.

And while that isn't actually correct in an "atomic op" situation, it
*is* fine in the case of set_buffer_uptodate(), since if the buffer
was already uptodate, any other CPU looking at that bit will not be
caring about what *this* CPU did.

IOW, if this CPU sees the bit as having ever been uptodate before,
then any barriers are irrelevant, because they are about the original
setting of 'uptodate', not the new one.

So I think we can just do this:

  --- a/include/linux/buffer_head.h
  +++ b/include/linux/buffer_head.h
  @@ -137,12 +137,14 @@ BUFFER_FNS(Defer_Completion, defer_completion)

   static __always_inline void set_buffer_uptodate(struct buffer_head *bh)
   {
  -     /*
  -      * make it consistent with folio_mark_uptodate
  -      * pairs with smp_load_acquire in buffer_uptodate
  -      */
  -     smp_mb__before_atomic();
  -     set_bit(BH_Uptodate, &bh->b_state);
  +     if (!test_bit(BH_Uptodate, &bh->b_state)) {
  +             /*
  +              * make it consistent with folio_mark_uptodate
  +              * pairs with smp_load_acquire in buffer_uptodate
  +              */
  +             smp_mb__before_atomic();
  +             set_bit(BH_Uptodate, &bh->b_state);
  +     }
   }

   static __always_inline void clear_buffer_uptodate(struct buffer_head *bh)

and re-introduce the original code (maybe extend that comment to talk
about this "only first up-to-date matters".

HOWEVER.

I'd love to hear if you have a clear profile change, and to see
exactly which set_buffer_uptodate() is *so* important. Honestly, I
didn't expect the buffer head functions to even really matter much any
more, with pretty much all IO being about the page cache..

                          Linus
--===============4097648738328683875==--

