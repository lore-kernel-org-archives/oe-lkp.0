Content-Type: multipart/mixed; boundary="===============4177243739945783503=="
MIME-Version: 1.0
From: changbin.du@intel.com
To: lkp@lists.01.org
Subject: [PATCH v3] usb: gadget: forbid queuing request to a disabled ep
Date: Thu, 17 Dec 2015 18:00:31 +0800
Message-ID: <1450346431-8064-1-git-send-email-changbin.du@intel.com>
In-Reply-To: <87h9jifi9x.fsf@saruman.tx.rr.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4177243739945783503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: "Du, Changbin" <changbin.du@intel.com>

Queue a request to disabled ep  doesn't make sense, and induce caller
make mistakes.

Here is a example for the android mtp gadget function driver. A mem
corruption can happen on below senario.
1) On disconnect, mtp driver disable its EPs,
2) During send_file_work and receive_file_work, mtp queues a request
   to ep. (The mtp driver need improve its synchronization logic!)
3) mtp_function_unbind is invoked and all mtp requests are freed.
4) when udc process the request queued on step 2, will cause kernel
   NULL pointer dereference exception.

Signed-off-by: Du, Changbin <changbin.du@intel.com>
---
change from v2: igonre ep0 as it always enabled during usb session.
change from v1: add WARN_ON_ONCE message.
---
 include/linux/usb/gadget.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 3d583a1..0c5d9ea 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -402,6 +402,9 @@ static inline void usb_ep_free_request(struct usb_ep *e=
p,
 static inline int usb_ep_queue(struct usb_ep *ep,
 			       struct usb_request *req, gfp_t gfp_flags)
 {
+	if (WARN_ON_ONCE(!ep->enabled && !ep->address))
+		return -ESHUTDOWN;
+
 	return ep->ops->queue(ep, req, gfp_flags);
 }
 =

-- =

2.5.0


--===============4177243739945783503==--

