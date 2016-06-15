Content-Type: multipart/mixed; boundary="===============6888687839630324107=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86] 5ac0c41bf3: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe
Date: Wed, 15 Jun 2016 11:12:37 -0700
Message-ID: <CALCETrUoV9AbpTaQa_TmnEncogsMRmVvpyX0pBp6gxy8252JUw@mail.gmail.com>
In-Reply-To: <20160615180722.GG30309@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============6888687839630324107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 11:07 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Wed, Jun 15, 2016 at 10:55:34AM -0700, Andy Lutomirski wrote:
>> Isn't it this one?
>
> Yes, it is.
>
>> I'm not.  If %pF points at some silly helper, we still want the frames b=
elow it.
>
> Why silly helper? It points to the rIP where the *MSR instruction is.
> Can't get more precise than that.

A hypothetical helper.

void do_thing(unsigned long msr)
{
  rdmsr(...);
}

void actual_problem(void)
{
  do_thing(0xbaadc0de);
}

I want to see actual_problem in the log.

--Andy

--===============6888687839630324107==--

