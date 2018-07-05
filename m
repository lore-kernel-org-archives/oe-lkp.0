Content-Type: multipart/mixed; boundary="===============2341052262460458150=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 5c6de586e8: vm-scalability.throughput +12.4% improvement (from reorganizing struct inode?)
Date: Wed, 04 Jul 2018 18:37:00 -0700
Message-ID: <CA+55aFxaBZ+9RQcNbeJZPAUeutJhVe5QLsRYEzTeOX_8vROAFQ@mail.gmail.com>
In-Reply-To: <20180704233415.GA30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2341052262460458150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 4, 2018 at 4:34 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> I don't hate that patch, but there are immediate followup questions - e.g.
> how sensitive is relative position of i_lock/i_hash/i_sb?  Those are *not*
> close to each other.  E.g. what happens if one moves i_hash right after
> i_ino?

I think that's a separate issue from just packing things better.

The original patch is at

    https://marc.info/?l=3Dlinux-fsdevel&m=3D152880180732361&w=3D2

although I certainly agree with the "just re-send as a proper patch,
now with a note on potential performance improvements".

I do agree that we could also see if there is something we could do
about sorting the inode by commonly used fields. We already do to some
degree (thge first fields up to and including i_security are certainly
hot), but the field ordering is old and maybe things have changed.

           Linus

--===============2341052262460458150==--

