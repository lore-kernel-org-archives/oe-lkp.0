Content-Type: multipart/mixed; boundary="===============5515972282086234380=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Thu, 06 Dec 2018 20:01:46 -0800
Message-ID: <CAHk-=wjVuLjZ1Wr52W=hNqh=_8gbzuKA+YpsVb4NBHCJsE6cyA@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.21.1812061505010.162675@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5515972282086234380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2018 at 3:43 PM David Rientjes <rientjes@google.com> wrote:
>
> On Broadwell, the access latency to local small pages was +5.6%, remote
> hugepages +16.4%, and remote small pages +19.9%.
>
> On Naples, the access latency to local small pages was +4.9%, intrasocket
> hugepages +10.5%, intrasocket small pages +19.6%, intersocket small pages
> +26.6%, and intersocket hugepages +29.2%

Are those two last numbers transposed?

Or why would small page accesses be *faster* than hugepages for the
intersocket case?

Of course, depending on testing, maybe the page itself was remote, but
the page tables were random, and you happened to get a remote page
table for the hugepage case?

> The results on Murano were similar, which is why I suspect Aneesh
> introduced the __GFP_THISNODE requirement for thp in 4.0, which preferred,
> in order, local small pages, remote 1-hop hugepages, remote 2-hop
> hugepages, remote 1-hop small pages, remote 2-hop small pages.

it sounds like on the whole the TLB advantage of hugepages is smaller
than the locality advantage.

Which doesn't surprise me on x86, because TLB costs really are fairly
low. Very good TLB fills, relatively to what I've seen elsewhere.

> So it *appears* from the x86 platforms that NUMA matters much more
> significantly than hugeness, but remote hugepages are a slight win over
> remote small pages.  PPC appeared the same wrt the local node but then
> prefers hugeness over affinity when it comes to remote pages.

I do think POWER at least historically has much weaker TLB fills, but
also very costly page table creation/teardown. Constant-time O(1)
arguments about hash lookups are only worth so much when the constant
time is pretty big. They've been working on it.

So at least on POWER, afaik one issue is literally that hugepages made
the hash setup and teardown situation much better.

One thing that might be worth looking at is whether the process itself
is all that node-local. Maybe we could aim for a policy that says
"prefer local memory, but if we notice that the accesses to this vma
aren't all that local, then who cares?".

IOW, the default could be something more dynamic than just "always use
__GFP_THISNODE". It could be more along the lines of "start off using
__GFP_THISNODE, but for longer-lived processes that bounce around
across nodes, maybe relax it?"

I don't think we have that kind of information right now, though, do we?

Honestly, I think things like vm_policy etc should not be the solution
- yes, some people may know *exactly* what access patterns they want,
but for most situations, I think the policy should be that defaults
"just work".

In fact, I wish even MADV_HUGEPAGE itself were to approach being a
no-op with THP.

We already have TRANSPARENT_HUGEPAGE_ALWAYS being the default kconfig
option (but I think it's a bit detbatable, because I'm not sure
everybody always agrees about memory use), so on the whole
MADV_HUGEPAGE shouldn't really *do* anything.

                     Linus

--===============5515972282086234380==
Content-Type: application/pkcs7-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIT/AYJKoZIhvcNAQcCoIIT7TCCE+kCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghEQMIIF5jCCA86gAwIBAgIQapvhODv/K2ufAdXZuKdSVjANBgkqhkiG9w0BAQwFADCBhTELMAkG
A1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEa
MBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxKzApBgNVBAMTIkNPTU9ETyBSU0EgQ2VydGlmaWNh
dGlvbiBBdXRob3JpdHkwHhcNMTMwMTEwMDAwMDAwWhcNMjgwMTA5MjM1OTU5WjCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQC+s55XrCh2dUAWxzgDmNPGGHYhUPMleQtMtaDRfTpYPpynMS6n9jR22YRq2tA9NEjk6vW7
rN/5sYFLIP1of3l0NKZ6fLWfF2VgJ5cijKYy/qlAckY1wgOkUMgzKlWlVJGyK+UlNEQ1/5ErCsHq
9x9aU/x1KwTdF/LCrT03Rl/FwFrf1XTCwa2QZYL55AqLPikFlgqOtzk06kb2qvGlnHJvijjI03BO
rNpo+kZGpcHsgyO1/u1OZTaOo8wvEU17VVeP1cHWse9tGKTDyUGg2hJZjrqck39UIm/nKbpDSZ0J
sMoIw/JtOOg0JC56VzQgBo7ictReTQE5LFLG3yQK+xS1AgMBAAGjggE8MIIBODAfBgNVHSMEGDAW
gBS7r34CPfqm8TyEjq3uOJjs2TIy1DAdBgNVHQ4EFgQUgq9sjPjF/pZhfOgfPStxSF7Ei8AwDgYD
VR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwEQYDVR0gBAowCDAGBgRVHSAAMEwGA1Ud
HwRFMEMwQaA/oD2GO2h0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNlcnRpZmljYXRp
b25BdXRob3JpdHkuY3JsMHEGCCsGAQUFBwEBBGUwYzA7BggrBgEFBQcwAoYvaHR0cDovL2NydC5j
b21vZG9jYS5jb20vQ09NT0RPUlNBQWRkVHJ1c3RDQS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9v
Y3NwLmNvbW9kb2NhLmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAeFyygSg0TzzuX1bOn5dW7I+iaxf2
8/ZJCAbU2C81zd9A/tNx4+jsQgwRGiHjZrAYayZrrm78hOx7aEpkfNPQIHGG6Fvq3EzWf/Lvx7/h
k6zSPwIal9v5IkDcZoFD7f3iT7PdkHJY9B51csvU50rxpEg1OyOT8fk2zvvPBuM4qQNqbGWlnhMp
IMwpWZT89RY0wpJO+2V6eXEGGHsROs3njeP9DqqqAJaBa4wBeKOdGCWn1/Jp2oY6dyNmNppI4ZNM
UH4Tam85S1j6E95u4+1Nuru84OrMIzqvISE2HN/56ebTOWlcrurffade2022O/tUU1gb4jfWCcyv
B8czm12FgX/y/lRjmDbEA08QJNB2729Y+io1IYO3ztveBdvUCIYZojTq/OCR6MvnzS6X72HP0PRL
RTiOSEmIDsS5N5w/8IW1Hva5hEFy6fDAfd9yI+O+IMMAj1KcL/Zo9jzJ16HO5m60ttl1Enk8MQkz
/W3JlHaeI5iKFn4UJu1/cP2YHXYPiWf2JyBzsLBrGk1II+3yL8aorYew6CQvdVifC3HtwlSam9V1
niiCfOBe2C12TdKGu05LWIA3ZkFcWJGaNXOZ6Ggyh/TqvXG5v7zmEVDNXFnHn9tFpMpOUvxhcsjy
cBtH0dZ0WrNw6gH+HF8TIhCnH3+zzWuDN0Rk6h9KVkfKehIwggXYMIIDwKADAgECAhBMqvnK22Nv
4B/3TthbA4adMA0GCSqGSIb3DQEBDAUAMIGFMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRl
ciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRl
ZDErMCkGA1UEAxMiQ09NT0RPIFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xMDAxMTkw
MDAwMDBaFw0zODAxMTgyMzU5NTlaMIGFMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBN
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
AaOCAfMwggHvMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBRjn/GS
Juh8DKxLx8YgPKopKgyxBTAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAX
BggrBgEFBQcDBAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYM
KwYBBAGyMQECAQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BT
MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggr
BgEFBQcwAoZJaHR0cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGlj
YXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2Rv
Y2EuY29tMCgGA1UdEQQhMB+BHXRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnMA0GCSqGSIb3
DQEBCwUAA4IBAQAGi1sxlNUFKWBzuBr+awa5Pl46M0AHRkFPiu3VKUkaNu8XuIA2i6Pj6rgiT/3l
7ca/KvxohOUvFTYnq6Fr26H6BJT6XaMiC6LItbfoIMB2yzFOVuruxfTUO7TCJPCg4oLEtUUIMS1v
KrajMYuEaI5rVAY04ntAa9nRnjj8TqDg+OXupr8yHrkomt7qWlsyZQKExtmQ4DvfEUADDY2ue6Kn
qNa5FHY8uBWlYBSaHnnR90Rr0Rqd4naFPQ1Kkkxp35g0tcdGBN5Qcyli834X9rdyhj9CwSwOSnCD
KYvaXyUP3o7hBubLcdMz/VM9VKT5HnU6c3rFemJSmUc41Htu57YYMYICsDCCAqwCAQEwga0wgZcx
CzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZv
cmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVu
dCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAyRamH6VuTQrvgXSXzzbh6jAN
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQg8V7GOBqqf6NYUcSE6YP7JH9o7vjJR6Jf
+3H6BEFn0hQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTgxMjA3
MDQwMjAzWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAJH1L9rfPkUkABIW5uRd4FB08HHjm30kOAOz7jaI62G2SvhPsj71
cugMJBLOgzTfflcbfMHUxOeTVFrxIqMpTC4PGdHRjzJsYl76yU6jmAkeUjzd8WUuxaiuefEqFrkI
6aKaEAxCARrZve+ao7zM6nGwUQLEsz1seRIy4Ofrnf8ejIkxSXniP7zVq/EPI05nBiYnoH7ErT40
GPVKqt26SbPFyyl/PoyZXJC+sO9bz5xIVOJhNBEmb3FJ1qSkvgx7Q5VauCz0MDEvQtOrly3RXtyP
JaeTYTHwLdAAeix8wGUqK9SYfCsCuoTlBWAvy+QSUNZAICVAPs7tXA7oSpiuDWQ=
--===============5515972282086234380==--

