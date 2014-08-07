Content-Type: multipart/mixed; boundary="===============4468086081594182378=="
MIME-Version: 1.0
From: Christoph Lameter <cl@gentwo.org>
To: lkp@lists.01.org
Subject: Re: [this_cpu_ptr] BUG: unable to handle kernel
Date: Thu, 07 Aug 2014 11:43:14 -0500
Message-ID: <alpine.DEB.2.11.1408071142490.2141@gentwo.org>
In-Reply-To: <alpine.DEB.2.11.1408070847370.10503@gentwo.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4468086081594182378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > Christoph, the new branch head 858dc288fc98 looks great, I do not find
> > boot errors in it. :)
>
> Yeah. There are still failures though. It seems that the cpumask_var_t
> can be defined differently and it seems that one variant requires
> this_cpu_load whereas the other requires this_cpu_ptr.

Updated the tree again after hopefully finally dealing with the breakage.


--===============4468086081594182378==--

