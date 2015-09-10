Content-Type: multipart/mixed; boundary="===============4075147756790131238=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [locktorture] 5f6a140f30: kernel BUG at drivers/base/driver.c:153!
Date: Thu, 10 Sep 2015 15:59:42 +0200
Message-ID: <20150910135942.GA21983@redhat.com>
In-Reply-To: <20150909185654.GK4029@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4075147756790131238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/09, Paul E. McKenney wrote:
>
> This is obsolete, but its replacement is the same patch.

fbe3b97183f84155d81e506b1aa7d2ce986f7a36 in linux-rcu.git#experimental
I guess?

> Oleg, Davidlohr, am I missing something on how percpu_rwsem or
> locktorture work?

No, I think the patch is fine. Thanks for doing this! I was going to
send something like this change too. And in fact I am still thinking
about another test which plays with rcu_sync only, but probably we
need some cleanups first (and we need them anyway). I'll try to do
this a bit later.

> +void torture_percpu_rwsem_init(void)
> +{
> +	BUG_ON(percpu_init_rwsem(&pcpu_rwsem));
> +}
> +

Aha, we don't really need this... I mean we can use the static initialiser
which can also be used by uprobes and cgroups. I'll try to send the patch
tomorrow.

Thanks!

Oleg.


--===============4075147756790131238==--

