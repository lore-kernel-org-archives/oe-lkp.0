Content-Type: multipart/mixed; boundary="===============7656081033904905849=="
MIME-Version: 1.0
From: Louis Langholtz <lou_langholtz@me.com>
To: lkp@lists.01.org
Subject: from int to bool for boolean uses in kernel sources?
Date: Mon, 26 Jan 2015 12:44:15 -0700
Message-ID: <6262F890-3487-4037-82C7-890D3A343F52@me.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7656081033904905849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Huang (and others on the lkp mailing list),

Might you (or anyone else with a test lab) possibly be interested in testin=
g my github 'bool' branch of the linux kernel sources (https://github.com/l=
ouis-langholtz/linux/tree/bool) with your test environment? It might prove =
interesting to Linux kernel development community.

Like many, I prefer using the C-language 'bool' type ('_Bool') over the 'in=
t' type for variables used as boolean. Denoted as bool, I get the idea that=
 the variable is to be used - not surprisingly - in a boolean way that's ar=
guably more encapsulated than an int. I realize though that historically th=
e use of bool within the kernel sources hasn't been without drawbacks and i=
ts detractors (https://lkml.org/lkml/2013/8/31/138) too however. The negati=
ves to using bool seem to be really entirely based on the C-language standa=
rd used and to the compiler's ability to make use of the bool type on the g=
iven hardware. Seems like some clever optimizations should be able to make =
bool faster than int without breaking things.

I've been working in that branch to change code over to use the C-language =
'bool' type instead of the 'int' type for variables that are used as boolea=
ns. I have so far avoided changing exported symbols but have changed many (=
if not most) of the internally used boolean variables particularly in the k=
ernel directory. I haven't touched any driver code yet and have tried to st=
ay away from changing arch dependent code. I'm sure I've missed a lot of pl=
aces as I've just done these refactorings by hand using the Eclipse IDE.

I'd like to know what performance changes that has beyond just noticing tha=
t the output of the 'size' command shows a space savings when using bool (w=
hich is not surprising since the size of a bool using gcc on my VM is 1 whi=
le the size of an int is 4). My test resources are much more limited than y=
ours appear to be however.

Here's the size output for the linux kernel code to compare with my bool br=
anch (after I compiled the kernel using gcc version 4.8.2 for x86_64):

size linux/vmlinux linux-bool/vmlinux
          text      data     bss     dec     hex filename
12009812   1550520 1077248 14637580 df5a0c linux/vmlinux
12009263   1550520 1077248 14637031 df57e7 linux-bool/vmlinux

Thank you.

Lou
--===============7656081033904905849==--

