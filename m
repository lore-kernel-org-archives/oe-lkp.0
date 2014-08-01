Content-Type: multipart/mixed; boundary="===============4087909646019700953=="
MIME-Version: 1.0
From: Christoph Lameter <cl@gentwo.org>
To: lkp@lists.01.org
Subject: Re: [scheduler] BUG: unable to handle kernel paging request at 000000000000ce50
Date: Fri, 01 Aug 2014 08:58:52 -0500
Message-ID: <alpine.DEB.2.11.1408010855380.19843@gentwo.org>
In-Reply-To: <53D9F692.2090103@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4087909646019700953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Jul 2014, Lai Jiangshan wrote:

> >     this_cpu_ptr instead.
>
>
> -	struct cpumask *cpus =3D __get_cpu_var(load_balance_mask);
> +	struct cpumask *cpus =3D this_cpu_ptr(load_balance_mask);
>
>
> I think the conversion is wrong. it should be
> 			*this_cpu_ptr(&load_balance_mask);

Hmmm.... that is going to cause some pretty strange looking code. Would
the compiler/sparse not complain if the wrong type of pointer is assigned
to?


If we are retrieving a pointer then the right way to do things would be:

cpus =3D this_cpu_read(load_balance_mask);




--===============4087909646019700953==--

