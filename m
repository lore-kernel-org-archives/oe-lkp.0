Content-Type: multipart/mixed; boundary="===============4642866089053671210=="
MIME-Version: 1.0
From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
To: lkp@lists.01.org
Subject: Re: [PATCH net-next] net: dsa: remove tree refcount
Date: Thu, 09 Nov 2017 13:24:09 -0500
Message-ID: <87tvy3b99y.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <20171109181015.GH13277@lunn.ch>
List-Id: <oe-lkp.lists.linux.dev>

--===============4642866089053671210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Andrew Lunn <andrew@lunn.ch> writes:

> On Thu, Nov 09, 2017 at 12:36:52PM -0500, Vivien Didelot wrote:
>> Setting the refcount to 0 when allocating a tree to match the number of
>> switch devices it holds may cause an 'increment on 0; use-after-free'.
>> =

>> Tracking the number of devices in a tree with a kref is not really
>> appropriate anyway so removes it completely in favor of a basic counter.
>
> How are you protecting this basic counter? switches can come and go at
> random, modules are loaded and unloaded, probing can happen in
> parallel, probes can fail with EPROBE_DEFFER causing a switch to
> unregister itself while others are registering themselves, etc.

As for the kref, the counter is protected by dsa2_mutex which locks
switch registration, nothing changed.

> The point of using a kref is that it is a well known kernel method of
> safely handling this situation. When the last member of the tree goes
> away, we safely and atomically remove the tree. It worked well for a
> few years, until you refactored it. Maybe the correct solution is to
> revert your change?

The kref doesn't add any value here and make the code more complex. If
you prefer to keep it, a simple alternative can be provided to init the
refcount to 1 at initialization and decrement it after registration:

    diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
    index fd54a8e17986..1fb8beb66493 100644
    --- a/net/dsa/dsa2.c
    +++ b/net/dsa/dsa2.c
    @@ -51,9 +51,7 @@ static struct dsa_switch_tree *dsa_tree_alloc(int ind=
ex)
            INIT_LIST_HEAD(&dst->list);
            list_add_tail(&dsa_tree_list, &dst->list);

    -	/* Initialize the reference counter to the number of switches, not 1 =
*/
            kref_init(&dst->refcount);
    -	refcount_set(&dst->refcount.refcount, 0);

            return dst;
    }
    @@ -69,7 +67,9 @@ static struct dsa_switch_tree *dsa_tree_touch(int ind=
ex)
            struct dsa_switch_tree *dst;

            dst =3D dsa_tree_find(index);
    -	if (!dst)
    +	if (dst)
    +		dsa_tree_get(dst);
    +	else
                    dst =3D dsa_tree_alloc(index);

            return dst;
    @@ -765,6 +765,8 @@ int dsa_register_switch(struct dsa_switch *ds)

            mutex_lock(&dsa2_mutex);
            err =3D dsa_switch_probe(ds);
    +	if (ds->dst)
    +		dsa_tree_put(ds->dst);
            mutex_unlock(&dsa2_mutex);

            return err;


Getting rid of the refcount seems simpler, but we can use this
alternative instead. Let me know what you prefer.


Thanks,

        Vivien

--===============4642866089053671210==--

