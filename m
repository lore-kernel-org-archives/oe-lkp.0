Content-Type: multipart/mixed; boundary="===============4433205268084170717=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Wed, 05 Jun 2019 10:21:17 +0800
Message-ID: <20190605022117.kw6tldcwhdkyqd6u@gondor.apana.org.au>
In-Reply-To: <20190604211449.GU28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4433205268084170717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 02:14:49PM -0700, Paul E. McKenney wrote:
>
> Yeah, I know, even with the "volatile" keyword, it is not entirely clear
> how much reordering the compiler is allowed to do.  I was relying on
> https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html, which says:

The volatile keyword doesn't give any guarantees of this kind.
The key to ensuring ordering between unrelated variable/register
reads/writes is the memory clobber:

	6.47.2.6 Clobbers and Scratch Registers

	...

	"memory" The "memory" clobber tells the compiler that the assembly
	code performs memory reads or writes to items other than those
	listed in the input and output operands (for example, accessing
	the memory pointed to by one of the input parameters). To ensure
	memory contains correct values, GCC may need to flush specific
	register values to memory before executing the asm. Further,
	the compiler does not assume that any values read from memory
	before an asm remain unchanged after that asm; it reloads them as
	needed. Using the "memory" clobber effectively forms a read/write
	memory barrier for the compiler.

	Note that this clobber does not prevent the processor from
	doing speculative reads past the asm statement. To prevent that,
	you need processor-specific fence instructions.

IOW you need a barrier().

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4433205268084170717==--

