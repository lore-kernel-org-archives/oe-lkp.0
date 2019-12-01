Content-Type: multipart/mixed; boundary="===============4300439155067119668=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/pat: Fix off-by-one bugs in interval tree search
Date: Sun, 01 Dec 2019 20:53:15 +0100
Message-ID: <20191201195315.GB3615@gmail.com>
In-Reply-To: <CAJTyqKPUhQR_DjSkMs3s9YSWA-tQXQvtnLqzxF353W9nnQ2cLw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4300439155067119668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Mariusz Ceier <mceier@gmail.com> wrote:

> Your patch fixes performance issue on my system and afterwards
> /sys/kernel/debug/x86/pat_memtype_list contents are:

Great, thanks for testing it!

> PAT memtype list:

> uncached-minus @ 0xfed90000-0xfed91000
> write-combining @ 0x2000000000-0x2100000000
> write-combining @ 0x2000000000-0x2100000000
> uncached-minus @ 0x2100000000-0x2100001000

Note how the UC- region starts right after the WC region, which triggered =

the bug on your system.

> It's very similar to pat_memtype_list contents after reverting 4
> x86/mm/pat patches affecting performance:
> =

> @@ -1,8 +1,8 @@
>  PAT memtype list:
>  write-back @ 0x55ba4000-0x55ba5000
>  write-back @ 0x5e88c000-0x5e8b5000
> -write-back @ 0x5e8b4000-0x5e8b8000
>  write-back @ 0x5e8b4000-0x5e8b5000
> +write-back @ 0x5e8b4000-0x5e8b8000
>  write-back @ 0x5e8b7000-0x5e8bb000
>  write-back @ 0x5e8ba000-0x5e8bc000
>  write-back @ 0x5e8bb000-0x5e8be000
> @@ -21,8 +21,8 @@
>  uncached-minus @ 0xec260000-0xec264000
>  uncached-minus @ 0xec300000-0xec320000
>  uncached-minus @ 0xec326000-0xec327000
> -uncached-minus @ 0xf0000000-0xf0001000
>  uncached-minus @ 0xf0000000-0xf8000000
> +uncached-minus @ 0xf0000000-0xf0001000

Yes, the ordering of same-start regions is different. I believe the =

difference is due to how the old rbtree logic inserted subtrees:


-       while (*node) {
-               struct memtype *data =3D rb_entry(*node, struct memtype, rb=
);
-
-               parent =3D *node;
-               if (data->subtree_max_end < newdata->end)
-                       data->subtree_max_end =3D newdata->end;
-               if (newdata->start <=3D data->start)
-                       node =3D &((*node)->rb_left);
-               else if (newdata->start > data->start)
-                       node =3D &((*node)->rb_right);
-       }
-
-       newdata->subtree_max_end =3D newdata->end;
-       rb_link_node(&newdata->rb, parent, node);
-       rb_insert_augmented(&newdata->rb, root, &memtype_rb_augment_cb);

In the new interval-tree logic this is:

        while (*link) {                                                    =
   \
                rb_parent =3D *link;                                       =
     \
                parent =3D rb_entry(rb_parent, ITSTRUCT, ITRB);            =
     \
                if (parent->ITSUBTREE < last)                              =
   \
                        parent->ITSUBTREE =3D last;                        =
     \
                if (start < ITSTART(parent))                               =
   \
                        link =3D &parent->ITRB.rb_left;                    =
     \
                else {                                                     =
   \
                        link =3D &parent->ITRB.rb_right;                   =
     \
                        leftmost =3D false;                                =
     \
                }                                                          =
   \
        }                                                                  =
   \
                                                                           =
   \
        node->ITSUBTREE =3D last;                                          =
     \
        rb_link_node(&node->ITRB, rb_parent, link);                        =
   \
        rb_insert_augmented_cached(&node->ITRB, root,                      =
   \
                                   leftmost, &ITPREFIX ## _augment);       =
   \

The old logic was a bit convoluted, but it can be written as:

                if (newdata->start <=3D data->start)
                        node =3D &parent->rb_left;
                else
                        node =3D &parent->rb_right;

The new logic is, in effect:

                if (start < data->start)
                        link =3D &parent->rb_left;
                else
                        link =3D &parent->rb_right;

Note the "<=3D" vs. '<' difference - this I believe changes the ordering =

within the tree. It's still fine as long as this is used consistently, =

but this changes the internal ordering of the nodes of the tree.

Thanks,

	Ingo
--===============4300439155067119668==--

