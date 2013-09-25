Content-Type: multipart/mixed; boundary="===============7635288965223151872=="
MIME-Version: 1.0
From: Lin Ming <minggr@gmail.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Wed, 25 Sep 2013 17:04:21 +0800
Message-ID: <CAF1ivSbYg296oHhO0_UXwkos8Ui_1C93pUnXPzow4qLWyAa2kg@mail.gmail.com>
In-Reply-To: <5238F252.5070905@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7635288965223151872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2013 at 8:22 AM, Peter Hurley <peter@hurleysoftware.com> =
wrote:
[snip]
>
> Looking over vmalloc.c, the critical section footprint of the vmap_area_l=
ock
> could definitely be reduced (even nearly eliminated), but that's a project
> for
> another day :)

Hi Peter,

I also looked over vmallo.c, but didn't find obvious way to reduce the
critical section footprint.
Could you share some hints how to do this?

Thanks,
Lin Ming

>
> Regards,
> Peter Hurley

--===============7635288965223151872==--

