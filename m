Content-Type: multipart/mixed; boundary="===============3621686197323717675=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] a06230b62b: kvm-unit-tests.vmx.fail
Date: Fri, 28 Feb 2020 08:51:35 +0100
Message-ID: <96533a86-feca-ace8-952b-7e5c88732ee5@redhat.com>
In-Reply-To: <20200228074408.GM6548@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3621686197323717675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 28/02/20 08:44, kernel test robot wrote:
> =1B[31mFAIL=1B[0m vmx (408415 tests, 3 unexpected failures, 2 expected fa=
ilures, 5 skipped)

Please include the commit of kvm-unit-tests that you are using. You are
likely missing "vmx: tweak XFAILS for #DB test".

Paolo

--===============3621686197323717675==--

