Content-Type: multipart/mixed; boundary="===============8742420792591745097=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [android/ion] 5fb70554d6: kernel_selftests.android.make_fail
Date: Wed, 01 Nov 2017 11:30:00 +0100
Message-ID: <20171101103000.GA4976@kroah.com>
In-Reply-To: <CAOuPNLh3qV_tYz=ah2yYL6EbLDT5dAeQOWofR=X6qk5NO-7EEA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8742420792591745097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2017 at 03:42:10PM +0530, Pintu Kumar wrote:
> According to this, it looks like we should maintain the local copy of
> the header file, until it is available.
> I also saw a similar approach in other selftests.
> =

> So, for time being shall I create a local copy of ion.h ?

Yes, just comment the heck out of both files saying that they need to be
kept in sync with each other.

thanks,

greg k-h

--===============8742420792591745097==--

