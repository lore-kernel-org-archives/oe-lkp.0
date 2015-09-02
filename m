Content-Type: multipart/mixed; boundary="===============1905072263188308329=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Wed, 02 Sep 2015 09:07:24 +0200
Message-ID: <20150902070724.GD11564@pox.localdomain>
In-Reply-To: <20150902020025.GA18184@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============1905072263188308329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/02/15 at 10:00am, Herbert Xu wrote:
> On Tue, Sep 01, 2015 at 04:51:24PM +0200, Thomas Graf wrote:
> >
> > 1. The current in-kernel self-test
> > 2. bind_netlink.c: https://github.com/tgraf/rhashtable
> =

> Thanks, I will try to reproduce this.

The path in question is:

int rhashtable_insert_rehash(struct rhashtable *ht)
{
	[...]

        old_tbl =3D rht_dereference_rcu(ht->tbl, ht);
        tbl =3D rhashtable_last_table(ht, old_tbl);

        size =3D tbl->size;

        if (rht_grow_above_75(ht, tbl))
                size *=3D 2;
        /* Do not schedule more than one rehash */
        else if (old_tbl !=3D tbl)
                return -EBUSY;

The behaviour in question is the immediate rehash during
insertion which we want to fail.

Commits:
        ccd57b1bd32460d27bbb9c599e795628a3c66983
        a87b9ebf1709687ff213091d0fdb4254b1564803

--===============1905072263188308329==--

