Content-Type: multipart/mixed; boundary="===============7546703635992692722=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [driver core] 570d020012: will-it-scale.per_thread_ops -12.2% regression
Date: Thu, 21 Feb 2019 10:12:17 +0100
Message-ID: <20190221091217.GA18701@kroah.com>
In-Reply-To: <20190221083926.GA7834@richard>
List-Id: <oe-lkp.lists.linux.dev>

--===============7546703635992692722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 04:39:27PM +0800, Wei Yang wrote:
> >>> I don't think this is an issues of struct device.  As you said, struct
> >>> device isn't access much during test.  Struct device may share slab p=
age
> >>> with some other data structures (signal related, or fd related (as in
> >>> some other test cases)), so that the alignment of these data structur=
es
> >>> are affected, so caused the performance regression.
> >>
> >> But allocation of a structure should always be "properly" aligned, no
> >> matter what something else did in the system as that is what kmalloc
> >> ensures.  If not, then we have problems in our memory allocator :)
> >>
> >> So something is odd here, but I don't think that is it...
> >
> >If all these data structure are allocated with kmalloc() instead of
> >kmem_cache_alloc(), then my guessing above seems incorrect ...
> >
> =

> Seems we don't have special kmem_cache for device and device_private.

Nor do we need one :)

Remember, 'struct device' is included inside lots of other structures
already, it is not very often created "on its own."

thanks,

greg k-h

--===============7546703635992692722==--

