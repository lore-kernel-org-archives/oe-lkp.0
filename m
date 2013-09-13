Content-Type: multipart/mixed; boundary="===============6862020928476282439=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Fri, 13 Sep 2013 05:34:05 -0700
Message-ID: <20130913123405.GB29683@kroah.com>
In-Reply-To: <5232E123.9090909@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6862020928476282439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 05:55:47AM -0400, Peter Hurley wrote:
> On 09/12/2013 11:44 PM, Greg KH wrote:
> > On Fri, Sep 13, 2013 at 11:38:04AM +0800, Fengguang Wu wrote:
> >> On Thu, Sep 12, 2013 at 08:17:00PM -0700, Greg KH wrote:
> >>> On Fri, Sep 13, 2013 at 08:51:33AM +0800, Fengguang Wu wrote:
> >>>> Hi Peter,
> >>>>
> >>>> FYI, we noticed much increased vmap_area_lock contentions since this
> >>>> commit:
> >>>
> >>> What does that mean?  What is happening, are we allocating/removing m=
ore
> >>> memory now?
> =

> No. Same amount of memory, allocated and freed with the same frequency as
> before.

Ok, I thought so.

> >>> What type of load were you running that showed this problem?
> >>
> >> The increased contentions and lock hold/wait time showed up in a
> >> number of test cases.
> =

> [...]
> =

> > That's a lot of slowdowns, especially for such a simple patch.
> >
> > Peter, any ideas?
> =

> Looks like this patch incidentally triggers some worst-case behavior in
> the memory manager. I'm not sure how this is possible with two 4k buffers,
> but the evidence is substantial.
> =

> This patch isn't critical so I suggest we back out this patch for mainline
> but use the patch to find out what's wrong in the vmap area.
> =

> Unfortunately, I'm on my way out the door and won't be back til Sunday pm=
 (EST)
> so I'll get a revert to you then. Sorry 'bout that.

No rush, we have plenty of time.

I think it would be good to track down the real root cause of this, so
that the allocators don't run into this problem again with some other
innocuous change.

thanks,

greg k-h

> =

> Regards,
> Peter Hurley

--===============6862020928476282439==--

