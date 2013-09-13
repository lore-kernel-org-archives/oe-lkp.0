Content-Type: multipart/mixed; boundary="===============8946255871954558391=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 12 Sep 2013 20:17:00 -0700
Message-ID: <20130913031700.GB23757@kroah.com>
In-Reply-To: <20130913005133.GA32479@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8946255871954558391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 08:51:33AM +0800, Fengguang Wu wrote:
> Hi Peter,
> =

> FYI, we noticed much increased vmap_area_lock contentions since this
> commit:

What does that mean?  What is happening, are we allocating/removing more
memory now?

What type of load were you running that showed this problem?

thanks,

greg k-h

--===============8946255871954558391==--

