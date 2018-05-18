Content-Type: multipart/mixed; boundary="===============3320386135300043285=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool: Detect assembly code falling through to INT3 padding
Date: Fri, 18 May 2018 20:51:36 +0300
Message-ID: <20180518175136.GB2055@avx2>
In-Reply-To: <20180518071814.GB26358@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3320386135300043285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 09:18:14AM +0200, Ingo Molnar wrote:
> The concept of built-in kernel tooling working at the machine code level =
is just =

> so powerful - we should have added our own KCC compiler 20 years ago.

...for two very serious reasons

* C as a language moves very slowly, last help from the comittee were
  C99 intializers which are OK, but, say, memory model was explictly
  rejected. However the project expands and becomes more complex much
  faster than C working group sets up meetings. Compiler authors help
  with extensions but ultimately can not be relied on (see "inline" saga).

  Recently everyone was celebrating new and improved min() and max()
  macros admiring creativity and knowledge of intricate language details
  (me too, don't get this wrong).

  Now this is how it can be done in a language which is not stupid:

	constexpr int min(int a, int b)
	{
		return a < b ? a : b;
	}

  That's literally all. And you can also do

	template<typename T>
	void min(T a, char b) =3D delete;

	template<typename T>
	void min(char a, T b) =3D delete;

  because "char" is char.

  Having control over compiler things like that can be addded more
  quickly.


* insulating the project from the whims of compiler authors who every
  once in a while use "undefined behaviour" or other kinds of language
  lawyering to do strange things.

  Other serious projects do this too. Database people use O_DIRECT
  to insulate themselves from kernel people for the very same reasons.

--===============3320386135300043285==--

