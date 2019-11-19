Content-Type: multipart/mixed; boundary="===============1093596881634598358=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [tcp] f859a44847: stderr.fastopen-client.pkt:#:runtime_error_in_sendto_call:Expected_result#but_got-#with_errno#(Operation_now_in_progress)
Date: Tue, 19 Nov 2019 10:07:54 +0800
Message-ID: <c45874a1-3ae8-80b7-0879-dcc66f48044f@intel.com>
In-Reply-To: <CA+FuTSdxO4TZm4t==kePydVY+qWRNQn6aaGKb3sK8sAJ8yFmLQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1093596881634598358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 11/14/19 5:02 AM, Willem de Bruijn wrote:
> On Tue, Nov 12, 2019 at 10:04 PM kernel test robot
> <rong.a.chen@intel.com> wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: f859a448470304135f7a1af0083b99e188873bb4 ("tcp: allow zerocopy w=
ith fastopen")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: packetdrill
>> with following parameters:
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 8G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
> The report shows the complete output of a complete packetdrill run.
>  From that it is not immediately obvious which packetdrill test output
> changed.
>
> The subject line calls out tcp/zerocopy/fastopen-client.pkt. The
> result of that test are expected to change with this commit
> f859a4484703 ("tcp: allow zerocopy with fastopen"), because this test
> was added exactly to verify the feature introduced with that commit.
>
> The report shows this specific test passing for ipv4 and
> ipv4-mapped-v6. I cannot explain why that run failed for ipv6. On my
> runs all three pass at this commit:

Hi Willem

the 0day robot reproduced this problem(runtime error in sendto call: Expect=
ed result 500 but got -1 with errno 115 (Operation now in progress))
20 times in 300 clean runs

I noticed that other
       guys caught "EINPROGRESS 115 Operation now in progress" years ago

       https://netdev.vger.kernel.narkive.com/Uq6aZ9q2/tcp-fast-open-questi=
on#post5

       He mentioned that "Namely, after getting -1 with EINPROGRESS, the
       caller

       must call write(2) again later"

if so, looks something need to be improved in testsuite packetdrill.



>    $ git clone https://github.com/google/packetdrill
>    $ cd packetdrill/gtests/net
>    $ (cd packetdrill; make)
>    $ ./packetdrill/run_all.py tcp/zerocopy
>    Ran   33 tests:   33 passing,    0 failing,    0 timed out (7.28
> sec): tcp/zerocopy
>
> and fail on the previous commit, along with all three versions of
> fastopen-server.pkt and closed.pkt:
>
>    $ ./packetdrill/run_all.py tcp/zerocopy
>    Ran   33 tests:   24 passing,    9 failing,    0 timed out (7.22
> sec): tcp/zerocopy
>
> All this is expected, so there is nothing to fix for this report.
>
> This was on a kernel built with `make defconfig; make kvmconfig` and
> additionally CONFIG_TUN=3Dy. Though those details should be immaterial
> here.
>
> Great that the test robot is running packetdrill tests, btw! Good to
> know we upstreamed them for a reason.
>
> But how did it end up testing such an old kernel? This commit was added i=
n 5.1.

the robot take a low priority for the low reproducible case to do the bisec=
tion.




Thanks


--===============1093596881634598358==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGRpdiBj
bGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAxMS8xNC8xOSA1OjAyIEFNLCBXaWxsZW0gZGUgQnJ1
aWpuCiAgICAgIHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSIKY2l0ZT0ibWlkOkNBK0Z1VFNkeE80VFptNHQ9PWtlUHlkVlkrcVdSTlFuNmFhR0tiM3NLOHNB
Sjh5Rm1MUUBtYWlsLmdtYWlsLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTA6MDQgUE0ga2VybmVsIHRlc3Qgcm9i
b3QKPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJvbmcuYS5j
aGVuQGludGVsLmNvbSI+Jmx0O3JvbmcuYS5jaGVuQGludGVsLmNvbSZndDs8L2E+IHdyb3RlOgo8
L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0i
bW96LXF1b3RlLXByZSIgd3JhcD0iIj4KRllJLCB3ZSBub3RpY2VkIHRoZSBmb2xsb3dpbmcgY29t
bWl0IChidWlsdCB3aXRoIGdjYy03KToKCmNvbW1pdDogZjg1OWE0NDg0NzAzMDQxMzVmN2ExYWYw
MDgzYjk5ZTE4ODg3M2JiNCAoInRjcDogYWxsb3cgemVyb2NvcHkgd2l0aCBmYXN0b3BlbiIpCjxh
IGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCI+aHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0PC9hPiBt
YXN0ZXIKCmluIHRlc3RjYXNlOiBwYWNrZXRkcmlsbAp3aXRoIGZvbGxvd2luZyBwYXJhbWV0ZXJz
OgoKCm9uIHRlc3QgbWFjaGluZTogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtIC1jcHUg
U2FuZHlCcmlkZ2UgLXNtcCAyIC1tIDhHCgpjYXVzZWQgYmVsb3cgY2hhbmdlcyAocGxlYXNlIHJl
ZmVyIHRvIGF0dGFjaGVkIGRtZXNnL2ttc2cgZm9yIGVudGlyZSBsb2cvYmFja3RyYWNlKToKPC9w
cmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIg
d3JhcD0iIj4KVGhlIHJlcG9ydCBzaG93cyB0aGUgY29tcGxldGUgb3V0cHV0IG9mIGEgY29tcGxl
dGUgcGFja2V0ZHJpbGwgcnVuLgpGcm9tIHRoYXQgaXQgaXMgbm90IGltbWVkaWF0ZWx5IG9idmlv
dXMgd2hpY2ggcGFja2V0ZHJpbGwgdGVzdCBvdXRwdXQKY2hhbmdlZC4KClRoZSBzdWJqZWN0IGxp
bmUgY2FsbHMgb3V0IHRjcC96ZXJvY29weS9mYXN0b3Blbi1jbGllbnQucGt0LiBUaGUKcmVzdWx0
IG9mIHRoYXQgdGVzdCBhcmUgZXhwZWN0ZWQgdG8gY2hhbmdlIHdpdGggdGhpcyBjb21taXQKZjg1
OWE0NDg0NzAzICgidGNwOiBhbGxvdyB6ZXJvY29weSB3aXRoIGZhc3RvcGVuIiksIGJlY2F1c2Ug
dGhpcyB0ZXN0CndhcyBhZGRlZCBleGFjdGx5IHRvIHZlcmlmeSB0aGUgZmVhdHVyZSBpbnRyb2R1
Y2VkIHdpdGggdGhhdCBjb21taXQuCgpUaGUgcmVwb3J0IHNob3dzIHRoaXMgc3BlY2lmaWMgdGVz
dCBwYXNzaW5nIGZvciBpcHY0IGFuZAppcHY0LW1hcHBlZC12Ni4gSSBjYW5ub3QgZXhwbGFpbiB3
aHkgdGhhdCBydW4gZmFpbGVkIGZvciBpcHY2LiBPbiBteQpydW5zIGFsbCB0aHJlZSBwYXNzIGF0
IHRoaXMgY29tbWl0Ogo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwcmU+SGkgV2lsbGVt
Cgo8L3ByZT4KICAgIDxwcmU+dGhlIDBkYXkgcm9ib3QgcmVwcm9kdWNlZCB0aGlzIHByb2JsZW0o
cnVudGltZSBlcnJvciBpbiBzZW5kdG8gY2FsbDogRXhwZWN0ZWQgcmVzdWx0IDUwMCBidXQgZ290
IC0xIHdpdGggZXJybm8gMTE1IChPcGVyYXRpb24gbm93IGluIHByb2dyZXNzKSkKMjAgdGltZXMg
aW4gMzAwIGNsZWFuIHJ1bnMKCjwvcHJlPgogICAgPHByZSBzdHlsZT0ib3V0bGluZTogbm9uZSAh
aW1wb3J0YW50OyBtYXJnaW46IDEwcHggMHB4IDBweDsgcGFkZGluZzoKICAgICAgMHB4OyBjb2xv
cjogcmdiKDUxLCA1MSwgNTEpOyBmb250LWZhbWlseTogwqAtYXBwbGUtc3lzdGVtLAogICAgICBC
bGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBSb2JvdG8sICZxdW90O05v
dG8KICAgICAgU2FucyZxdW90OywgVWJ1bnR1LCAmcXVvdDtEcm9pZCBTYW5zJnF1b3Q7LCAmcXVv
dDtIZWx2ZXRpY2EKICAgICAgTmV1ZSZxdW90Oywgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4
OyBmb250LXN0eWxlOiBub3JtYWw7CiAgICAgIGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1h
bDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsKICAgICAgZm9udC13ZWlnaHQ6IDQwMDsgbGV0
dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjoKICAgICAgc3RhcnQ7
IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZToKICAg
ICAgbm9ybWFsOyB3aWRvd3M6IDI7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ry
b2tlLXdpZHRoOgogICAgICAwcHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDUsIDI0NSwgMjQ1
KTsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOgogICAgICBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24t
Y29sb3I6IGluaXRpYWw7Ij5JIG5vdGljZWQgdGhhdCBvdGhlcgogICAgICBndXlzIGNhdWdodCAi
RUlOUFJPR1JFU1MgMTE1IE9wZXJhdGlvbiBub3cgaW4gcHJvZ3Jlc3MiIHllYXJzIGFnbzxicgog
ICAgICAgIHN0eWxlPSJvdXRsaW5lOiBub25lICFpbXBvcnRhbnQ7Ij4KICAgICAgPGEKaHJlZj0i
aHR0cHM6Ly9uZXRkZXYudmdlci5rZXJuZWwubmFya2l2ZS5jb20vVXE2YVo5cTIvdGNwLWZhc3Qt
b3Blbi1xdWVzdGlvbiNwb3N0NSIKICAgICAgICBjbGFzcz0iZXh0ZXJuYWwtbGluayIgcmVsPSJu
b2ZvbGxvdyIgc3R5bGU9Im91dGxpbmU6IG5vbmUKICAgICAgICAhaW1wb3J0YW50OyBjb2xvcjog
cmdiKDU5LCAxMTUsIDE3NSk7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsKICAgICAgICBjdXJzb3I6
IHBvaW50ZXI7Ij5odHRwczovL25ldGRldi52Z2VyLmtlcm5lbC5uYXJraXZlLmNvbS9VcTZhWjlx
Mi90Y3AtZmFzdC1vcGVuLXF1ZXN0aW9uI3Bvc3Q1PC9hPjxicgogICAgICAgIHN0eWxlPSJvdXRs
aW5lOiBub25lICFpbXBvcnRhbnQ7Ij4KICAgICAgSGUgbWVudGlvbmVkIHRoYXQgIk5hbWVseSwg
YWZ0ZXIgZ2V0dGluZyAtMSB3aXRoIEVJTlBST0dSRVNTLCB0aGUKICAgICAgY2FsbGVyPGJyIHN0
eWxlPSJvdXRsaW5lOiBub25lICFpbXBvcnRhbnQ7Ij4KICAgICAgbXVzdCBjYWxsIHdyaXRlKDIp
IGFnYWluIGxhdGVyIjwvcHJlPgogICAgPHByZT5pZiBzbywgbG9va3Mgc29tZXRoaW5nIG5lZWQg
dG8gYmUgaW1wcm92ZWQgaW4gdGVzdHN1aXRlIHBhY2tldGRyaWxsLgoKCgo8L3ByZT4KICAgIDxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiCmNpdGU9Im1pZDpDQStGdVRTZHhPNFRabTR0PT1rZVB5ZFZZ
K3FXUk5RbjZhYUdLYjNzSzhzQUo4eUZtTFFAbWFpbC5nbWFpbC5jb20iPgogICAgICA8cHJlIGNs
YXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgogICQgZ2l0IGNsb25lIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvcGFja2V0
ZHJpbGwiPmh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvcGFja2V0ZHJpbGw8L2E+CiAgJCBjZCBw
YWNrZXRkcmlsbC9ndGVzdHMvbmV0CiAgJCAoY2QgcGFja2V0ZHJpbGw7IG1ha2UpCiAgJCAuL3Bh
Y2tldGRyaWxsL3J1bl9hbGwucHkgdGNwL3plcm9jb3B5CiAgUmFuICAgMzMgdGVzdHM6ICAgMzMg
cGFzc2luZywgICAgMCBmYWlsaW5nLCAgICAwIHRpbWVkIG91dCAoNy4yOApzZWMpOiB0Y3AvemVy
b2NvcHkKCmFuZCBmYWlsIG9uIHRoZSBwcmV2aW91cyBjb21taXQsIGFsb25nIHdpdGggYWxsIHRo
cmVlIHZlcnNpb25zIG9mCmZhc3RvcGVuLXNlcnZlci5wa3QgYW5kIGNsb3NlZC5wa3Q6CgogICQg
Li9wYWNrZXRkcmlsbC9ydW5fYWxsLnB5IHRjcC96ZXJvY29weQogIFJhbiAgIDMzIHRlc3RzOiAg
IDI0IHBhc3NpbmcsICAgIDkgZmFpbGluZywgICAgMCB0aW1lZCBvdXQgKDcuMjIKc2VjKTogdGNw
L3plcm9jb3B5CgpBbGwgdGhpcyBpcyBleHBlY3RlZCwgc28gdGhlcmUgaXMgbm90aGluZyB0byBm
aXggZm9yIHRoaXMgcmVwb3J0LgoKVGhpcyB3YXMgb24gYSBrZXJuZWwgYnVpbHQgd2l0aCBgbWFr
ZSBkZWZjb25maWc7IG1ha2Uga3ZtY29uZmlnYCBhbmQKYWRkaXRpb25hbGx5IENPTkZJR19UVU49
eS4gVGhvdWdoIHRob3NlIGRldGFpbHMgc2hvdWxkIGJlIGltbWF0ZXJpYWwKaGVyZS4KCkdyZWF0
IHRoYXQgdGhlIHRlc3Qgcm9ib3QgaXMgcnVubmluZyBwYWNrZXRkcmlsbCB0ZXN0cywgYnR3ISBH
b29kIHRvCmtub3cgd2UgdXBzdHJlYW1lZCB0aGVtIGZvciBhIHJlYXNvbi4KCkJ1dCBob3cgZGlk
IGl0IGVuZCB1cCB0ZXN0aW5nIHN1Y2ggYW4gb2xkIGtlcm5lbD8gVGhpcyBjb21taXQgd2FzIGFk
ZGVkIGluIDUuMS48L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwcmU+dGhlIHJvYm90IHRh
a2UgYSBsb3cgcHJpb3JpdHkgZm9yIHRoZSBsb3cgcmVwcm9kdWNpYmxlIGNhc2UgdG8gZG8gdGhl
IGJpc2VjdGlvbi4KCgoKClRoYW5rczwvcHJlPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIK
Y2l0ZT0ibWlkOkNBK0Z1VFNkeE80VFptNHQ9PWtlUHlkVlkrcVdSTlFuNmFhR0tiM3NLOHNBSjh5
Rm1MUUBtYWlsLmdtYWlsLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdy
YXA9IiI+CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============1093596881634598358==--

